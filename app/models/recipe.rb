class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :meal

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(ingredient_attribute)
      self.ingredients << ingredient
    end
  end
  
end
