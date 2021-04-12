require 'net/https'
require 'uri'
require 'line/bot'
class HomeController < ApplicationController
  
  def top
    @user = User.new
    if session[:user_id]
     @current_user = User.find(session[:user_id])
    end


    if params[:code].present?
      uri = URI.parse("https://api.line.me/oauth2/v2.1/token")
      req = Net::HTTP::Post.new(uri)
      req.content_type = "application/x-www-form-urlencoded"
      req.set_form_data(
      "client_id" => ENV['CLIENT_ID'],
      "client_secret" => ENV['CLIENT_SECRET'],
      "code" => params[:code],
      "grant_type" => "authorization_code",
      "redirect_uri" => ENV['SITE_URL'],
    )
    req_options = {
      use_ssl: uri.scheme == "https" 
     }
     response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(req)
      end
      result = JSON.parse(response.body)
      token= result["access_token"]
      uri_2 = URI.parse('https://api.line.me/v2/profile')
      req_2 = Net::HTTP::Get.new(uri_2)
      req_2['authorization'] = "Bearer #{token}"
      req_options_2 = {
        use_ssl: uri_2.scheme == "https" 
       }
       response = Net::HTTP.start(uri_2.hostname, uri_2.port, req_options_2) do |http|
        http.request(req_2)
      end

      result = JSON.parse(response.body)
      user_id= result["userId"]
      message = {
        type: 'text',
        text: "https://www.youtube.com/embed/hge3fr50o0o"
      }
      client = Line::Bot::Client.new { |config|
          config.channel_secret = ENV['CHANNEL_SECRET']
          config.channel_token = ENV['CHANNEL_TOKEN']
      }
      response = client.push_message(user_id, message)
      p response
    end
  end
  def home
    render status: 200
  end
end
