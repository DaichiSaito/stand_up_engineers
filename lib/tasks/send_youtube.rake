# frozen_string_literal: true

namespace :send_youtube do
  desc 'youtubeの動画をユーザーに提供する'
    task send_line: :environment do
        users = User.all
        users.each do |user|
        p user.clock.present?
        if (user.clock.present?) && Time.now.strftime("%Y-%m-%d %H:%M") == (user.clock.start_time + user.clock.set_time * 60).strftime("%Y-%m-%d %H:%M")
            videos = Video.where(category_name: user.clock.category)
            number = videos.length.-1
            n = rand(number)
            @video = videos[n]
            messages = [{
              type: 'text',
              text: '休憩時間になりました！さあ、立ち上がりましょう！！'
            },
            {
              type: 'text',
              text: "https://www.youtube.com/embed/#{@video.video_id}"
            }]
            client = Line::Bot::Client.new { |config|
                config.channel_secret = ENV['CHANNEL_SECRET']
                config.channel_token = ENV['CHANNEL_TOKEN']
            }
            response = client.push_message(user.line_id, messages)
            user.clock.start_time = (Time.now + user.clock.break_time * 60)
            user.clock.save

        elsif (user.clock.present?) && Time.now.strftime("%Y-%m-%d %H:%M") == (user.clock.start_time).strftime("%Y-%m-%d %H:%M")
            message = {
              type: 'text',
              text: "がんばる時間になりました！今から#{user.clock.set_time}分 集中してがんばりましょう！！"
            }
            client = Line::Bot::Client.new { |config|
                config.channel_secret = ENV['CHANNEL_SECRET']
                config.channel_token = ENV['CHANNEL_TOKEN']
            }
            response = client.push_message(user.line_id, message)
        end
      end
    end
  end
