class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = if User.all.empty?
              'no users found at all!'
            else
              User.find(params[:id])
            end
  end
end
