class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
    @meals = Meal.all
  end
  
end
