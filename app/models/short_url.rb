class ShortUrl < ActiveRecord::Base

  attr_accessible :user_id, :long_url_id, :url

  belongs_to :long_url
  belongs_to :user
  has_many :visits
  has_many :visitors, :through => :visits, :source => :user
  has_many :comments
  has_many :tags
  has_many :tag_topics, :through => :tags

  validates :user_id, :long_url_id, :url, :presence => true
  validates :url, :uniqueness => true
  validates :user_id, :long_url_id, :numericality => {
    :greater_than_or_equal_to => 1,
    :only_integer => true
  }

  def self.most_popular(lim = 5)
    short_url_ids = Visit.group("visited_short_url_id").order("count(visited_short_url_id) DESC")
  end

  def num_visits(time = 10.years)
    time_range = (Time.now - time)..Time.now
    self.visits.where(:created_at => time_range).count
  end

  def uniq_visitors
    self.visitors.uniq
  end

  def num_uniq_visits
    uniq_visitors.count
  end

end
