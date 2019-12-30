# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_post, only: %i[new create save_like]

  def new
    @comment = Comment.new
  end

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

  def save_like
    @like = @post.likes.create
    @like.user_id = current_user.id
    @like.save

    redirect_to '/'
  end

  private

  def find_post
    @post = Post.friendly.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
