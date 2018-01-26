class RecipeIngredientsController < ApplicationController

  def destroy
    if current_user
      @recipe = Recipe.find(params[:recipe][:id])
      @ingredient = Ingredient.find(params[:id])
      @recipe.ingredients.destroy(@ingredient)
      redirect_to recipe_path(@recipe)
    else
      redirect_to root_path
    end
  end

end
