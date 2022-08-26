class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def index
    render json: Comment.where(author_id: params[:user_id], post_id: params[:post_id]).all
  end

  def create
    @client = current_user
    @post = Post.find(params[:post_id])
    allparams = params.require(:comment).permit(:text)
    allparams['author_id'] = @client.id
    allparams['post_id'] = @post.id
    comment = Comment.new(allparams)
    if comment.save
      redirect_to request.referrer
    else
      render :index
    end
  end
end
