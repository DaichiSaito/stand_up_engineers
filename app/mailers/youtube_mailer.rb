class YoutubeMailer < ApplicationMailer
    def youtube_mail(user)
        @user = user
        mail(
            subject: 'オススメの画像',
            to: "#{@user.email}",
            from: 'sue@example.com'
        )
    end
end
