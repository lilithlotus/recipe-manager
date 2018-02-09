class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :meal
  has_many :images
  validates :name, :instructions, presence: true

  #def to_param
    #{}"#{id}-#{name}"
  #end

  def recipe_ingredients_attributes=(recipe_ingredients_attributes)

    recipe_ingredients_attributes.each do |recipe_ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(name: recipe_ingredient_attribute[1]["name"])
      if !ingredient.name.blank?
        self.recipe_ingredients.build(quantity: recipe_ingredient_attribute[1]["quantity"], ingredient_id: ingredient.id)
      end
    end
  end

  def self.by_meal(meal_id)
    where(meal: meal_id)
  end

end
