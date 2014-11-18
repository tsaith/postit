class Comment < ActiveRecord::Base
  include VoteableTh

  belongs_to :user
  belongs_to :post

  validates :body, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true

end
