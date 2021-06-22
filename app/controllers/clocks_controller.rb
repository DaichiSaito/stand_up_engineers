# frozen_string_literal: true

class ClocksController < ApplicationController

  before_action :user_present, only: [:destroy, :create]

  def create
    user =  User.find(session[:user_id])
    clock = Clock.new(clock_params)
    clock.user_id = user.id
    clock.start_time = Time.now
    clock.save!
    redirect_to root_path, notice: 'アプリを起動しました!'
  end

  def destroy
    if @current_user.clock.present?
       @current_user.clock.destroy
       redirect_to root_path, notice: 'アプリを終了しました'
    else
       redirect_to root_path, notice: 'アプリを終了しました'
    end
  end

  private

    def clock_params
      params.require(:clock).permit(:set_time, :break_time,:category)
    end
end
