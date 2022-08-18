class PostsController < ApplicationController
  def index
    @posts = Post.where(params[:id]).where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end
  
  def new
    @user = current_user
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
end
