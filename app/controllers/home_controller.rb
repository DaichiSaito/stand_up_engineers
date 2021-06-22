# frozen_string_literal: true

require 'net/https'
require 'uri'
require 'line/bot'

class HomeController < ApplicationController

  before_action :user_present
  
  def top
      @clock = Clock.new
    end
  end