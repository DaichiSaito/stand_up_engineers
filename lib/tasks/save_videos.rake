namespace :save_videos do
    desc "youtubeの動画を保存する"
     task save_video: :environment do
         Video.find_videos(%w(筋トレ ストレッチ ヨガ なかやまきんに君))
         from = Video.first.id
         to = Video.first.id + 39
         #Video.where(id: from..to).destroy_all
     end
end
