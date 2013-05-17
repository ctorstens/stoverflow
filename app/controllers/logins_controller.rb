class LoginsController < ApplicationController
  # include SessionHelper

  def new
    @user = User.new
  end

  def create
    @user = User.where(handle: params[:user][:handle]).first.authenticate(params[:user][:password])
    if @user
      session[:id] = @user.id
      redirect_to "/users/#{@user.handle}"
    else
      render :new
    end
  end

  def delete
    session.clear
    redirect_to '/'
  end
end
