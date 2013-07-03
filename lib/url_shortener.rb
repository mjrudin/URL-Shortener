require 'launchy'

class Shortener

  attr_reader :user

  def initialize(user = nil)
    @user = user
  end

  def self.login(username)
    @user = User.where(:username => username).first_or_create
  end

  def self.shorten(long_url)
    raise "must be logged in to shorten URL." if @user.nil?
    long = LongUrl.where(:url => long_url).first_or_create
    short = ShortUrl.create(:user_id => @user.id, :long_url_id => long.id, :url => SecureRandom.urlsafe_base64)
    tag_url(short.id)
  end

  def self.expand(short_url)
    raise "must be logged in to expand URL." if @user.nil?
    raise "invalid short url" if ShortUrl.where(:url => short_url).nil?
    short = ShortUrl.find_by_url(short_url)
    long = LongUrl.find(short.long_url_id)
    Visit.create(:user_id => @user.id, :short_url_id => short.id)
    Launchy.open(long.url)
  end

  def self.comment_on_link(short_url)
    raise "must be logged in to comment on URL." if @user.nil?
    short = ShortUrl.find_by_url(short_url)
    print "Enter your comment> "
    body = gets.chomp
    Comment.create(:user_id => @user.id, :short_url_id => short.id, :body => body)
  end

  def self.tag_url(short_url_id)
    tags = []
    while tags.empty?
      print "Tag your link(enter '--tags' for possible tags)> "
      t = gets.chomp.split(/ /)
      if t == ["--tags"]
        TagTopic.all.each {|topic| print "[#{topic.tag.capitalize}] "}
        puts ""
      else
        (t - TagTopic.pluck(:tag)).empty? ? tags = t : (puts "Invalid tag.")
      end
    end
    tags.map! {|tag| TagTopic.find_by_tag(tag.downcase)}
    tags.each {|tag| Tag.create(:short_url_id => short_url_id, :tag_topic_id => tag.id)}
  end

end