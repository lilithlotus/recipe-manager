class RecipesController < ApplicationController
  include ApplicationHelper
  def new
    if logged_in?
      @recipe = Recipe.new
      @recipe.recipe_ingredients.build
      @recipe.recipe_ingredients.build
      @recipe.recipe_ingredients.build
      @recipe.recipe_ingredients.build
      @recipe.recipe_ingredients.build
      @recipe.recipe_ingredients.build
      @recipe.recipe_ingredients.build
      @recipe.recipe_ingredients.build
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
    @recipe.comments.build

  end

  def edit
    @recipe = Recipe.find(params[:id])
    if current_user == @recipe.user
      @recipe.recipe_ingredients.build
      @recipe.recipe_ingredients.build
      @recipe.recipe_ingredients.build
      @recipe.recipe_ingredients.build
    else
      redirect_to root_path
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if current_user == @recipe.user
      if @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
      else
        render 'edit'
      end
    end
  end

  def index
    @recipes = Recipe.all
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    if current_user == @recipe.user
      @recipe.destroy
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cook_time, :servings, :instructions, :meal_id, recipe_ingredients_attributes: [:name, :quantity])
  end

end
