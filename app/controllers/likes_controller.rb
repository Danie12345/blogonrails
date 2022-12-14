class LikesController < ApplicationController
  def create
    @client = current_user
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    like = Like.new(author: @client, post: @post)
    respond_to do |format|
      format.html do
        if like.save
          flash[:success] = 'Comment created successfully!'
          redirect_to request.referrer
        else
          flash.now[:error] = 'Error: Comment could not be saved!'
          render :new, locals: { like: }
        end
      end
    end
  end
end
