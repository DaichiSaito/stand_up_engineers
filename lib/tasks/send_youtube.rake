# frozen_string_literal: true

namespace :send_youtube do
  desc 'youtubeの動画をユーザーに提供する'
    task send_line: :environment do
        users = User.all
        users.each do |user|
        if (user.clock.present?) && Time.now.strftime("%Y-%m-%d %H:%M") == (user.clock.start_time + user.clock.set_time * 60).strftime("%Y-%m-%d %H:%M")
            videos = Video.where(category_name: user.clock.category)
            n = rand(10)
            @video = videos[n]
            message = {
              type: 'text',
              text: "https://www.youtube.com/embed/#{@video.video_id}"
            }
            client = Line::Bot::Client.new { |config|
                config.channel_secret = ENV['CHANNEL_SECRET']
                config.channel_token = ENV['CHANNEL_TOKEN']
            }
            p client
            response = client.push_message(user.line_id, message)
            user.clock.start_time = (Time.now + user.clock.break_time * 60)
            user.clock.save
            p "#{user.name}さんにlineを通知しました"
            p response
          else
            puts "#{user.name}さんはアプリを起動していません"
            p Time.now.strftime("%Y-%m-%d %H:%M")
            
            if user.clock.present?
              p user.clock.start_time.strftime("%Y-%m-%d %H:%M")
            end
          end
        end
    end
end