class ApplicationController < ActionController::Base
    add_flash_types :success, :info, :warning, :danger

    private

    def user_present
        if User.where(id: session[:user_id]).exists?
            @current_user = User.find(session[:user_id])
        else
            session.delete(:user_id)
            p "no_session_user"
        end
    end
end
