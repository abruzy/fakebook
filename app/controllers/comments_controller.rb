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
      flash[:success] = 'you liked a post'
      redirect_to post_path(@post)
    else
      flash[:danger] = 'you have already liked this post'
      render 'new'
    end
  end

  def save_like
    current_user.likes.build(post_id: @post.id)
    if current_user.save
      flash[:success] = 'you liked a post'
    else
      flash[:danger] = 'you have already liked this post'
    end

    redirect_to root_path
  end

  private

  def find_post
    @post = Post.friendly.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
