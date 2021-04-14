require 'net/https'
require 'uri'
require 'line/bot'
class HomeController < ApplicationController
  
  def top
    if session[:user_id]
     @current_user = User.find(session[:user_id])
     @clock = Clock.new
    end
  end


  def home
    render status: 200
  end
end
