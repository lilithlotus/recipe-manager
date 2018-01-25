class Image < ApplicationRecord
  belongs_to :recipe 
  validates :url, presence: true
end
