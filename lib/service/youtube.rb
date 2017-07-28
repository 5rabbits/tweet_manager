require 'yt'
# Retrieve channel's video from YouTube
class Youtube
  CHANNEL_ENDPOINT = 'https://www.googleapis.com/youtube/v3/channels'.freeze
  PLAYLIST_ENDPOINT = 'https://www.googleapis.com/youtube/v3/playlistItems'.freeze
  YOUTUBE_URL = 'https://www.youtube.com/watch'.freeze

  def initialize(api_key)
    @api_key = api_key
    @agent = Mechanize.new
  end

  def videos(channel_id)
    playlists(channel_id).map { |playlist| video_from_playlist(playlist) }.flatten
  end

  def video_from_playlist(playlist_id)
    params = {
      playlistId: playlist_id,
      key: @api_key,
      part: 'snippet',
      maxResults: 50
    }
    response = parse_response(@agent.get(PLAYLIST_ENDPOINT, params))
    parse_videos(response)
  end

  def last_content(channel_id)
    videos(channel_id).first
  end

  def random_content(channel_id)
    videos(channel_id).sample
  end

  private

  def parse_response(response)
    JSON.parse(response.body)
  end

  def playlists(channel_id)
    params = {
      key: @api_key,
      part: 'contentDetails',
      id: channel_id
    }
    response = parse_response(@agent.get(CHANNEL_ENDPOINT, params))
    response['items'].map { |item| item['contentDetails'].values.first['uploads'] }
  end

  def parse_videos(result)
    result['items'].map { |item| parse_video(item['snippet']) }
  end

  def parse_video(video)
    {
      title: video['title'],
      url: "#{YOUTUBE_URL}/#{video['resourceId']['videoId']}"
    }
  end
end
