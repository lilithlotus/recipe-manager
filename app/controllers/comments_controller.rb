class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    binding.pry
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @recipe
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
