# frozen_string_literal: true

class ClocksController < ApplicationController
  
  before_action :set_clock_or_redirect, only: ['create']
  
  def create
    Clock.create_clock(session[:user_id], clock_params)
    redirect_to root_path, notice: 'アプリを起動しました!'
  end

  def destroy
    @current_user.clock.destroy if @current_user&.clock.present?
    redirect_to root_path, notice: 'アプリを終了しました'
  end

  private

    def clock_params
      params.require(:clock).permit(:set_time, :break_time,:category)
    end

    def set_clock_or_redirect
      #他のブラウザでログアウトしている場合アプリを起動できないようにし、ログアウトした状態を作る  
      redirect_to root_path, danger: 'ユーザーが存在しません。再ログインしてください' unless @current_user
    end
  end
    
