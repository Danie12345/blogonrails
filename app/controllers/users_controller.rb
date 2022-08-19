class UsersController < ApplicationController
  def index
    @client = current_user
    @users = User.all
  end

  def show
    @client = current_user
    @user = User.find(params[:id])
  end
end
