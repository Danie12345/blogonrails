class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def index
    render json: Comment.where(author_id: params[:user_id], post_id: params[:post_id]).all
  end
end
