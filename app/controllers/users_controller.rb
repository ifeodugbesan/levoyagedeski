class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_posts = Post.where(user: current_user)
    @my_tips = Tip.where(user: current_user)
    @my_articles = Article.where(user: current_user)
    authorize @user
  end
end
