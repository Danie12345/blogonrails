class CommentsController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    allparams = params.require(:comment).permit(:text)
    allparams["author_id"] = @user.id
    allparams["post_id"] = @post.id
    puts allparams
    comment = Comment.new(allparams)
    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = "Comment created successfully!"
          redirect_to user_post_path(user_id: @user.id, id: @post.id)
        else
          flash.now[:error] = "Error: Comment could not be saved!"
          render :new, locals: { post: comment }
        end
      end
    end
  end
end
