class UsersController < ApplicationController
  # helper UserHelper

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      redirect_to users_path(@user.handle)
    else
      render :new
    end
  end

  def show
    @user = User.where(handle: params[:id]).first
  end

end
