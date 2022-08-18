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

  def create
    @user = current_user
    allparams = params.require(:post).permit(:title, :text)
    allparams["author"] = @user
    puts allparams
    post = Post.new(allparams)
    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = "Post created successfully!"
          redirect_to user_posts_path(user_id: @user.id)
        else
          flash.now[:error] = "Error: Post could not be saved!"
          render :new, locals: { post: post }
        end
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
end
