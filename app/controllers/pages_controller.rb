class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :resources, :seen_pwa]

  def home
    redirect_to posts_path if user_signed_in?
  end

  def resources
  end

  def seen_pwa
    cookies.permanent[:not_first_visit] = true
  end
end
