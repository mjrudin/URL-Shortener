class Visit < ActiveRecord::Base

  attr_accessible :user_id, :short_url_id

  belongs_to :user
  belongs_to :short_url

  validates :user_id, :short_url_id, :presence => true
  validates :user_id, :short_url_id, :numericality => {
    :greater_than_or_equal_to => 1,
    :only_integer => true
  }

end
