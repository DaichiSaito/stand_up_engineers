# frozen_string_literal: true

class ClocksController < ApplicationController
  before_action :set_user_or_redirect, only: ['destroy']
  before_action :set_clock_or_redirect, onry: ['create']
  def create
    user =  User.find(session[:user_id])
    clock = Clock.new(clock_params)
    clock.user_id = user.id
    clock.start_time = Time.now
    if clock.save
      redirect_to root_path, notice: 'アプリを起動しました!'
    else
      redirect_to root_path, danger: 'アプリを起動できませんでした'
     end
  end

  def destroy
    if @user.clock.present?
      @user.clock.destroy
      redirect_to root_path, notice: 'アプリを終了しました'
    else
      redirect_to root_path, notice: 'アプリを終了しました'
    end
  end

  private

  def clock_params
    params.require(:clock).permit(:set_time, :break_time,:category)
  end

  def set_user_or_redirect
    if User.where(id: session[:user_id]).exists?
      @user = User.find(session[:user_id])
    else
      session.delete(:user_id)
      redirect_to root_path, notice: 'アプリを終了しました'
    end
  end

  def set_clock_or_redirect
    if User.where(id: session[:user_id]).exists?
      @current_user = User.find(session[:user_id])
    else
      session.delete(:user_id)
      redirect_to root_path, danger: 'ユーザーが存在しません。再ログインしてください'
    end
  end
end
