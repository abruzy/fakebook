class PostsController < ApplicationController
  before_action :find_post, only: %i[edit update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.friendly.find(params[:id]) 
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Your post has created successfully'
      redirect_to @post
    else
      flash[:danger] = 'Invalid post, Please try again!'
      render 'new'
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:success] = 'post was successfully updated.'
      redirect_to @post
    else
      flash[:danger] = 'Something went wrong, Please try again!'
      render :edit
    end
  end

  private

  def find_post
    @post = current_user.posts.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :image)
  end
end
