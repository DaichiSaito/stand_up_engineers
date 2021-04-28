# frozen_string_literal: true

namespace :save_videos do
  desc 'youtubeの動画を保存する'
  task save_video: :environment do
    Video.find_videos(%w[筋トレ ストレッチ ヨガ ザ・きんにくTV])
    from = Video.first.id
    to = Video.first.id + 9
    # Video.where(id: from..to).destroy_all
  end
end
