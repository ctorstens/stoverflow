class UsersController < ApplicationController
  helper SessionHelper

  def new
    @user = User.new
  end

  def create
    puts 'we are here******************'

    @user = User.new(params[:user])
    if @user.save
      sign_in
      redirect_to "/users/#{@user.handle}"
    else
      render :new
    end
  end

  def show
    @user = User.where(handle: params[:id]).first
  end

end
