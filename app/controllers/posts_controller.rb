class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = policy_scope(Post)
    # @posts = policy_scope(Post).where.not(user: current_user)
    @comment = Comment.new
  end

  def show
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
    authorize @post
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
    authorize @post
  end

  def destroy
    @post.destroy
    redirect_to posts_path
    authorize @post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :photo)
  end
end
