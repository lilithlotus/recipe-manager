class ImagesController < ApplicationController
  include ApplicationHelper

  def new
    @image = Image.new(recipe_id: params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:image][:recipe_id])
    if current_user == @recipe.user
      @image = Image.new(image_params)
      if @image.save
        redirect_to recipe_path(@recipe)
      else
        render 'new'
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    if current_user == @recipe.user
      @image = Image.find(params[:id]).destroy
      redirect_to recipe_path(@recipe)
    end
  end

  def show
    @image = Image.find(params[:recipe_id])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:image][:recipe_id])
    if current_user == @recipe.user
      @image = Image.find(params[:id])
      if @image.update(image_params)
        redirect_to recipe_path(@recipe)
      else
        render 'edit'
      end
    end
  end

  private

  def image_params
    params.require(:image).permit(:url, :caption, :recipe_id)
  end

end
