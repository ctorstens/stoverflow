class LoginsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.where(handle: params[:handle]).first.authenticate(params[:password])
    session[:id] = user.id
    redirect_to users_path(user.handle)
  end

  def delete
    session.clear
    redirect_to '/'
  end
end
