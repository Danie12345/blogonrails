class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    if Post.all.empty?
      @post = 'no posts found at all!'
    else
      @post = Post.find(params[:id])
    end
  end
end
