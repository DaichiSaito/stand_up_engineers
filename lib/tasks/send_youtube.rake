namespace :send_youtube do
    desc 'youtubeの動画をユーザーに提供する'
    task send_line_60: :environment do
        users = User.all
        users.each do |user|
          clock = user.clock
          if user.clock.set_time == ( 60 || 30 ) 
            videos = Video.where(category_name: clock.category)
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
            response = client.push_message(user.line_id, message)
          else
            p "error"
          end
        end
    end

    task send_line_30: :environment do
      users = User.all
      users.each do |user|
        clock = user.clock
        if user.clock.set_time == 60 
          videos = Video.where(category_name: clock.category)
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
          response = client.push_message(user.line_id, message)
        else
          p "error"
        end
      end
  end
end
