class Post < ActiveRecord::Base
  include VoteableTh
  include SluggableTh

  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :comments, :dependent => :destroy
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true, length: {minimum: 3}
  validates :url, presence: true, uniqueness: true
  validates :description, presence: true
  validates :category_ids, presence: true

  sluggable_column :title

end
