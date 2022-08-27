class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  authorize_resource

  def index
    render json: Comment.where(post_id: params[:post_id])
  end

  def create
    @client = current_user
    @post = Post.find(params[:post_id])
    allparams = params.require(:comment).permit(:text)
    allparams['author_id'] = @client.id
    allparams['post_id'] = @post.id
    comment = Comment.new(allparams)
    if comment.save
      render json: { message: 'Created comment :D' }, status: :created
    else
      render json: { message: 'Couldn\'t create comment :(' }, status: 400
    end
  end
end
