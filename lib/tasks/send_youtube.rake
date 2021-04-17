namespace :send_youtube do
    desc 'youtubeの動画をユーザーに提供する'
    task send_mail: :environment do
        users = User.all
        users.each do |user|
          clock = user.clock
          if Time.now >= clock.start_time
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
            clock.start_time = Time.now
            clock.save
          else
            
            p clock.start_time
          
          end
        end
    end
end
