class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @not_me = current_user != @user
    @my_posts = Post.where(user: @user)
    authorize @user
  end

  def all
    @users = User.all
    authorize current_user
  end

  def no_user
    redirect_to user_path(current_user)
    authorize current_user
  end
end
