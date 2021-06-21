# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :user_present, only: ['destroy']

  def new
    session[:user_id] = User.line_login(params[:code])
    redirect_to root_path, notice: 'ログインしました！'
  end

  def destroy
    if session[:user_id]
      user = User.find(params[:id])
      user.destroy
      @current_user = nil
      session.delete(:user_id)
      redirect_to root_path, notice: 'ログアウトしました！'
    else
      redirect_to root_path, notice: 'ログアウト済みです！'
    end
  end
end
