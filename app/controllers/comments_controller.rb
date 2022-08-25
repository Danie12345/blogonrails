class CommentsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def create
    @client = current_user
    @post = Post.find(params[:post_id])
    allparams = params.require(:comment).permit(:text)
    allparams['author_id'] = @client.id
    allparams['post_id'] = @post.id
    comment = Comment.new(allparams)
    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment created successfully!'
          redirect_to request.referrer
        else
          flash.now[:error] = 'Error: Comment could not be saved!'
          render :new, locals: { comment: }
        end
      end
    end
  end

  def destroy
    @client = current_user
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end
end
