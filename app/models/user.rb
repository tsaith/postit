class User < ActiveRecord::Base
  include SluggableTh
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}

  sluggable_column :username

  def admin?
    self.role.to_s == 'admin'
  end

end
