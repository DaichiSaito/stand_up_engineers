# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :user_present?

  private

  def user_present?
    return  @current_user if @current_user ||= User.find_by(id: session[:user_id])
    session.delete(:user_id)
  end
end
