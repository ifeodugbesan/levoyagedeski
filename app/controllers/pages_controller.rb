class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :resources, :seen_pwa]

  def home
    redirect_to user_path(current_user) if user_signed_in?
  end

  def resources
  end

  def seen_pwa
    cookies.permanent[:not_first_visit] = true
  end

  def toggle_dark_mode
    @dark_mode == true ? cookies.permanent[:dark_mode] = false : cookies.permanent[:dark_mode] = true
    redirect_to request.referrer
  end
end
