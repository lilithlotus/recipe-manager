class SessionsController < ApplicationController

  def new
  end

  def create

    if User.find_by(email: params[:session][:email])
      @user = User.find_by(email: params[:session][:email])
      return head(:forbidden) unless @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/login'
    end

  end


  def destroy
    session.destroy
    redirect_to root_path
  end

end
