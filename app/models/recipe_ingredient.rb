class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  def name
    if  Ingredient.find_by(id: ingredient_id)
      ingredient = Ingredient.find_by(id: ingredient_id)
      ingredient.name
    end
  end
end
