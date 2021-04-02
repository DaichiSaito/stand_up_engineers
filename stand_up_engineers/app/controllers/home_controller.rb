class HomeController < ApplicationController
  def top
    @user = User.new
    if session[:user_id]
     @current_user = User.find(session[:user_id])
    end
  end
end
