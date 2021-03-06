class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    def admin_user
      @user = current_user
      redirect_to(root_url) unless current_user && current_user.admin?
    end
end
