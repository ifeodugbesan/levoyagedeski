class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(post: @post, user: current_user)
    if @like.save
      render partial: 'posts/post_user', locals: { post: @post }
    else
      redirect_to posts_path, alert: 'Something went wrong'
    end
    authorize @like
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    authorize @like
    render partial: 'posts/post_user', locals: { post: @like.post }
  end
end
