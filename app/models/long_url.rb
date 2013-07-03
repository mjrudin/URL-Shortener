class LongUrl < ActiveRecord::Base
  VALID_URL = /^(http(?:s)?\:\/\/[a-zA-Z0-9\-]+(?:\.[a-zA-Z0-9\-]+)*\.[a-zA-Z]{2,6}(?:\/?|(?:\/[\w\-]+)*)(?:\/?|\/\w+\.[a-zA-Z]{2,4}(?:\?[\w]+\=[\w\-]+)?)?(?:\&[\w]+\=[\w\-]+)*)$/

  attr_accessible :url

  has_many :short_urls

  validates :url, :presence => true
  validates :url, :format => { :with => VALID_URL, :message => "invalid url." }

end
