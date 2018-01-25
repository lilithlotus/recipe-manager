class ImagesController < ApplicationController

  def new
    @image = Image.new(recipe_id: params[:recipe_id])
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect to recipe_image_path(@image)
    else
      render 'new'
    end
  end

    def show
      @image = Image.find(params[:id])
    end

    private
    def image_params
      params.require(:image).permit(:url, :caption, :recipe_id)
    end
end
