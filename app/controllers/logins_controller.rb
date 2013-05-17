class LoginsController < ApplicationController
  include SessionHelper

  def new
    @user = User.new
  end

  def create
    @user = User.where(handle: params[:user][:handle]).first.authenticate(params[:user][:password])
    if @user
      sign_in
      redirect_to "/users/#{@user.handle}"
    else
      render :new
    end
  end

  def delete
    sign_out
    redirect_to '/'
  end
end
