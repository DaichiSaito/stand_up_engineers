class YoutubeMailer < ApplicationMailer
    def youtube_mail(user)
        @user = user
        videos = Video.where(category_name: user.category)
        n = rand(10)
        @video = videos[n]
        mail(
            subject: 'オススメの画像',
            to: "#{@user.email}",
            from: 'sue@example.com'
        )
    end
end
