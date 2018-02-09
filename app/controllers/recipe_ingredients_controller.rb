class RecipeIngredientsController < ApplicationController
  include ApplicationHelper

  def destroy
    @recipe = Recipe.find(params[:recipe][:id])
    if current_user == @recipe.user
      @ingredient = Ingredient.find(params[:id])
      @recipe.ingredients.destroy(@ingredient)
      redirect_to recipe_path(@recipe)
    else
      redirect_to root_path
    end
  end
  
end
