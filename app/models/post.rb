class Post < ActiveRecord::Base
  validates :title, :description, presence: true

  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories 
end
