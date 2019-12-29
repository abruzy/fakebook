class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  private

  def find_post
    @post = current_user.posts.friendly.find(params[:id])
  end
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  

end
