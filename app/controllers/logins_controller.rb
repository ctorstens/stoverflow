class LoginsController < ApplicationController
  include SessionHelper

  def new
    @user = User.new
  end

  def create
    @user = User.where(handle: params[:user][:handle]).first
    if @user && @user.authenticate(params[:user][:password])
      sign_in
      redirect_to(@user)
    else
      @user = User.new 
      render :new
    end
  end

  def delete
    sign_out
    redirect_to '/'
  end
end
