class FacebookController < ApplicationController

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.password_digest = SecureRandom.hex(10)
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end

    session[:user_id] = @user.id

    render 'welcome/home'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
