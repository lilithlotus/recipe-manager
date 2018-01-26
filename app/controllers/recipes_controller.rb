class RecipesController < ApplicationController
  include ApplicationHelper
  def new
    if current_user
      @recipe = Recipe.new
      @recipe.ingredients.build
      @recipe.ingredients.build
      @recipe.ingredients.build
      @recipe.ingredients.build
      @recipe.ingredients.build
      @recipe.ingredients.build
      @recipe.ingredients.build
      @recipe.ingredients.build
    else
      redirect_to root_path
    end
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
    @user = @recipe.user
  end

  def edit
    if current_user
      @recipe = Recipe.find(params[:id])
      @recipe.ingredients.build
      @recipe.ingredients.build
      @recipe.ingredients.build
      @recipe.ingredients.build
    else
      redirect_to root_path
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def index
    @recipes = Recipe.all
  end

  def destroy
    if current_user
      @user = session[:user_id]
      @recipe = Recipe.find(params[:id]).destroy
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cook_time, :servings, :instructions, :meal_id, ingredients_attributes: [:name])
  end
end
