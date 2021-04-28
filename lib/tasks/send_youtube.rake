# frozen_string_literal: true

namespace :send_youtube do
  desc 'youtubeの動画をユーザーに提供する'
  task send_line_60: :environment do
    users = User.all
    users.each do |user|
      if user.clock.present? && (user.clock.set_time == 60 || 30)
        videos = Video.where(category_name: user.clock.category)
        n = rand(videos.length - 1)
        video = videos[n]
        message = {
          type: 'text',
          text: "https://www.youtube.com/embed/#{video.video_id}"
        }
        client = Line::Bot::Client.new do |config|
          config.channel_secret = ENV['CHANNEL_SECRET']
          config.channel_token = ENV['CHANNEL_TOKEN']
        end
        response = client.push_message(user.line_id, message)
        p "#{user.name}さんに動画を通知しました"
      else
        p "#{user.name}さんはアプリを起動していません"
      end
    end
  end

  task send_line_30: :environment do
    users = User.all
    users.each do |user|
      if user.clock.present? && (user.clock.set_time == 30)
        videos = Video.where(category_name: user.clock.category)
        n = rand(videos.length - 1)
        video = videos[n]
        message = {
          type: 'text',
          text: "https://www.youtube.com/embed/#{video.video_id}"
        }
        client = Line::Bot::Client.new do |config|
          config.channel_secret = ENV['CHANNEL_SECRET']
          config.channel_token = ENV['CHANNEL_TOKEN']
        end
        response = client.push_message(user.line_id, message)
        p "#{user.name}さんに動画を通知しました"
      else
        p "#{user.name}さんはアプリを起動していません"
      end
    end
  end
end
