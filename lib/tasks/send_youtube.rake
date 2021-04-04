namespace :send_youtube do
    desc 'youtubeの動画をユーザーに提供する'
    task send_mail: :environment do
        users = User.all
        users.each do |user|
          if Time.now.strftime("%Y-%m-%d %H:%M") <= (user.start_time + user.set_time * 60).strftime("%Y-%m-%d %H:%M")
                YoutubeMailer.youtube_mail(user).deliver
                user.start_time = (Time.now + user.break_time * 60)
                user.save
          else
            
            puts "false"

          end
        end
    end
end
