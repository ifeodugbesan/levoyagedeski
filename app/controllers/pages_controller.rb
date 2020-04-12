class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :seen_pwa]

  def home
    if user_signed_in?
      redirect_to posts_path
    end
  end

  def seen_pwa
    cookies.permanent[:not_first_visit] = true
  end
end
