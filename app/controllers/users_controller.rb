class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_posts = Post.where(user: current_user)
    @my_tips = Tip.where(user: current_user)
    @my_articles = Article.where(user: current_user)
    authorize @user
  end

  def no_user
    redirect_to user_path(current_user)
    authorize current_user
  end
end
