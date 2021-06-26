# frozen_string_literal: true

class UsersController < ApplicationController

  def new
    session[:user_id] = User.line_login(params[:code])
    redirect_to root_path, notice: 'ログインしました！'
  end

  def destroy
    @current_user.destroy if @current_user
    redirect_to root_path, notice: 'ログアウトしました！'
  end
end
