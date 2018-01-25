class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def create
    @recipe = Recipe.find(params[:id])
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:url, :caption)
  end

end
