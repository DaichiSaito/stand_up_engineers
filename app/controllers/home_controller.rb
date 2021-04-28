# frozen_string_literal: true

require 'net/https'
require 'uri'
require 'line/bot'
class HomeController < ApplicationController
  before_action :user_present
  def top
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @clock = Clock.new
    end
  end

  def terms; end
  
  def privacy; end
  
  def home
    render status: 200
  end
end
