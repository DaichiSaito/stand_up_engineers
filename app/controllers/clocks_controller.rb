# frozen_string_literal: true

class ClocksController < ApplicationController
  
  before_action :set_clock_or_redirect, only: ['create']
  
  def create
    Clock.create_clock(clock_params)
    redirect_to root_path, notice: 'アプリを起動しました!'
  end

  def destroy
    @current_user.clock.destroy if @current_user&.clock.present?
    redirect_to root_path, notice: 'アプリを終了しました'
  end

  private

    def clock_params
      params.require(:clock).permit(:set_time, :break_time, :category).merge(user_id: @current_user.id)
    end

    def set_clock_or_redirect
      redirect_to root_path, danger: 'ユーザーが存在しません。再ログインしてください' unless @current_user
    end
  end
    
