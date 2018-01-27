class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
    @recipes = Recipe.by_meal(params[:id])
  end

end
