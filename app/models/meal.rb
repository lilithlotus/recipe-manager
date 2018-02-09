class Meal < ApplicationRecord
  has_many :recipes

  def to_param
    "#{id}-#{title}"
  end
  
end
