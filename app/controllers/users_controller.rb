class UsersController < ApplicationController
  helper SessionHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in
      redirect_to "/users/#{@user.handle}"
    else
      redirect_to '/signup'
    end
  end

  def show
    @user = User.where(handle: params[:id]).first
  end

end
