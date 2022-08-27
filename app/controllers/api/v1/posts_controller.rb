class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def index
    @client = current_user
    @posts = Post.where(params[:id]).where(author_id: params[:user_id])
    render json: @posts
  end
end
