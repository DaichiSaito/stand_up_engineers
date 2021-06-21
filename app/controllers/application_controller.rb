# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  private

  def user_present
    if User.where(id: session[:user_id]).exists?
      @current_user = User.find(session[:user_id])
    else
      #もし他のブラウザでユーザーを消してしまっている場合sessionだけが残らないようにする
      session.delete(:user_id)
    end
  end
end
