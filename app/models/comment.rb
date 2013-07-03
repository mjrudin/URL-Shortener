class Comment < ActiveRecord::Base
  attr_accessible :body, :short_url_id, :user_id

  belongs_to :short_url
  belongs_to :user

  validates :body, :short_url_id, :user_id, :presence => true
  validates :short_url_id, :user_id, :numericality => {
    :greater_than_or_equal_to => 1,
    :only_integer => true
  }


end
