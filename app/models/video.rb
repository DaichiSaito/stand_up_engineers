# frozen_string_literal: true

class Video < ApplicationRecord
  require 'google/apis/youtube_v3'
  require 'active_support/all'

  def self.find_videos(keywords, after: 12.months.ago, before: Time.now)
    keywords.each do |keyword|
      keyword += ' 10分'
      service = Google::Apis::YoutubeV3::YouTubeService.new
      service.key = ENV['SECRET_KEY']
      next_page_token = nil
      opt = {
        q: keyword,
        type: 'video',
        max_results: 50,
        order: :date,
        page_token: next_page_token,
        published_after: after.iso8601,
        published_before: before.iso8601
      }
      results = service.list_searches(:snippet, opt)
      results.items.each do |item|
        id = item.id
        snippet = item.snippet
        keyword.slice!(' 10分')
        video = Video.create(category_name: keyword, title: snippet.title, video_id: id.video_id)
      end
    end
  end
end
