class Video < ApplicationRecord
require 'google/apis/youtube_v3'
require 'active_support/all'

GOOGLE_API_KEY = ENV['SECRET_KEY']

def self.find_videos(keywords, after: 1.months.ago, before: Time.now)
  keywords.each do |keyword|
  service = Google::Apis::YoutubeV3::YouTubeService.new
  service.key = GOOGLE_API_KEY
  next_page_token = nil
  opt = {
    q: keyword,
    type: 'video',
    max_results: 10,
    order: :date,
    page_token: next_page_token,
    published_after: after.iso8601,
    published_before: before.iso8601
  }
  results = service.list_searches(:snippet, opt)
  results.items.each do |item|
    id = item.id
    snippet = item.snippet
    video =  Video.create(category_name: keyword, title: snippet.title, video_id: id.video_id)
  end
end
end
end