class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :download]

  def index
    @posts = policy_scope(Post).order(created_at: :desc)
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
      flash[:success] = "Post created!"
      redirect_to posts_path
    else
      render :new
    end
    authorize @post
  end

  def edit
    authorize @post
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
    authorize @post
  end

  def destroy
    @post.destroy
    flash[:danger] = "Post deleted!"
    redirect_to params[:show].present? ? posts_path : user_path(@post.user)
    authorize @post
  end

  def download
    authorize @post
    attachment_name = @post.photo.blob.filename.to_s
    attachment_url = @post.photo.service_url(secure: true)
    content_type = attachment_name.split('.').last
    file = Down.download(attachment_url)

    send_file(
      file,
      filename: attachment_name,
      type: content_type
    )
  rescue Down::NotFound => e
    p e
    redirect_to posts_path, alert: "Couldn't download post"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :photo)
  end
end
