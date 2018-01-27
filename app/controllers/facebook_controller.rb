class FacebookController < ApplicationController

  def create
    @user = User.find_or_create_by(uid: auth['uid'], password_digest: auth['info']['name']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
    binding.pry

    session[:user_id] = @user.id

    render 'welcome/home'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
