class PostsController < ApplicationController
  def index
    @posts = Post.where(params[:id]).where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @posts = Post.where(params[:id]).where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end
end
