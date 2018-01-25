class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = session[:user_id]
    if @recipe.save

      redirect_to recipe_path(@recipe)

    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def destroy
    @user = session[:user_id]
    @recipe = Recipe.find(params[:id]).destroy
    redirect_to user_path(@user)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cook_time, :servings, :instructions, :meal_id, ingredients_attributes: [:name])
  end
end
