class ImagesController < ApplicationController

  def new
    @image = Image.new(recipe_id: params[:recipe_id])
  end

  def create
    binding.pry
    @recipe = Recipe.find(params[:image][:recipe_id])
    @image = Image.new(image_params)
    if @image.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def destroy

    @recipe = Recipe.find(params[:recipe_id])
    @image = Image.find(params[:id]).destroy
    redirect_to recipe_path(@recipe)
  end

    def show
      @image = Image.find(params[:id])
    end

    def edit
      @image = Image.find(params[:id])
    end

    def update
      binding.pry
      @recipe = Recipe.find(params[:image][:recipe_id])
      @image = Image.find(params[:id])
      if @image.update(image_params)
        redirect_to recipe_path(@recipe)
      else
        render 'edit'
      end
    end

    private
    def image_params
      params.require(:image).permit(:url, :caption, :recipe_id)
    end
end
