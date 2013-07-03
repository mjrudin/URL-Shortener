class TagTopic < ActiveRecord::Base
  attr_accessible :tag

  has_many :tags
  has_many :short_urls, :through => :tags

  validates :tag, :presence => true

  #most popular sites for all tags
  def self.most_popular_sites
    TagTopic.all.each do |topic|
      puts "[#{topic.tag.capitalize}]"
      topic.short_urls.joins(:visits).group('visits.short_url_id')
      .order('count(visits.short_url_id) DESC')
      .each {|short| puts short.long_url.url}
      puts ""
    end
  end

  def self.most_popular_sites_for_tag(tag)
    TagTopic.find_by_tag(tag).short_urls.joins(:visits)
    .group('visits.short_url_id').order('count(visits.short_url_id) DESC')
    .each {|short| puts short.long_url.url}
  end

  # most popular site for an instance of a tag topic (e.g. most popular
  # "sports" sites)
  def most_popular_sites
    self.short_urls.joins(:visits).group('visits.short_url_id')
    .order('count(visits.short_url_id) DESC')
    .each {|short| puts short.long_url.url}
  end


end
