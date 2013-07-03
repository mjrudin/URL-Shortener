class Tag < ActiveRecord::Base
  attr_accessible :short_url_id, :tag_topic_id

  belongs_to :short_url
  belongs_to :tag_topic

  validates :short_url_id, :tag_topic_id, :presence => true
  validates :short_url_id, :tag_topic_id, :numericality => {
    :greater_than_or_equal_to => 1,
    :only_integer => true
  }
end
