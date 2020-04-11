class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(post: @post, user: current_user)
    if @like.save
      redirect_to posts_path
    else
      redirect_to posts_path, alert: 'Something went wrong'
    end
    authorize @like
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    authorize @like
    redirect_to posts_path
  end
end
