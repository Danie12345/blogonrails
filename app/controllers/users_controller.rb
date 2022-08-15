class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if User.all.empty?
      @user = 'no users found at all!'
    else
      @user = User.find(params[:id])
    end
  end
end
