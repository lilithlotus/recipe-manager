class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      @recipe.user_id = session[:user_id]
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cook_time, :servings, :instructions, :meal_id, ingredients_attributes: [:name])
  end
end
