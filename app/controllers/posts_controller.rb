class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = if Post.all.empty?
              'no posts found at all!'
            else
              Post.find(params[:id])
            end
  end
end
