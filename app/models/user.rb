class User < ActiveRecord::Base
  #No initialize is needed, as ActiveRecord automatically defines it.
  #To override initialize, call super
  attr_accessible :username

  validates :username, :uniqueness => true
  validates :username, :length => {:maximum => 255}
  validates :username, :presence => true

  has_many :short_urls
  has_many :visits
  #method call .visited_urls will give back the users short_urls through visits
  has_many :visited_urls, :through => :visits, :source => :short_urls
  has_many :comments

end
