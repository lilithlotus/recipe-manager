class User < ApplicationRecord
  has_many :recipes
  has_many :comments
  has_secure_password
  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
