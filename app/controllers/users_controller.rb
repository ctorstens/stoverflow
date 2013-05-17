class UsersController < ApplicationController
  # helper SessionHelper
# 
  def new
    @user = User.new
  end

  def create
    puts 'we are here******************'

    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect_to "/users/#{@user.handle}"
    else
      render :new
    end
  end

  def show
    @user = User.where(handle: params[:id]).first
  end

end
