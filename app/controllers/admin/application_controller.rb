module Admin
  class ApplicationController < ::ApplicationController

    before_action :require_logged_in_auth_user
    before_action :authenticate_user!

    private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

    def require_logged_in_auth_user
      unless current_user&.admin?
        flash[:alert] = "You dont have enough permissions"
        sign_out current_user
        redirect_to user_session_url
      end
    end
  end

end