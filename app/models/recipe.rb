class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :meal
  has_many :images
  validates :name, :instructions, presence: true

  def to_param
    "#{id}-#{name}"
  end

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(ingredient_attribute)
      if !ingredient.name.blank? && !self.ingredients.include?(ingredient)
        self.ingredients << ingredient
      end
    end
  end

  def self.by_meal(meal_id)
    where(meal: meal_id)
  end

end
