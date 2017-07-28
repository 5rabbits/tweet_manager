require 'tweet_manager/version'
require 'service/medium'
require 'service/youtube'
require 'twitter'

module TweetManager
  # Tweet content
  class Tweet
    AVALAIBLE_SERVICES = %w[medium youtube].freeze
    TYPES = %w[last random].freeze

    def initialize(credentials, youtube_api_key)
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = credentials[:consumer_key]
        config.consumer_secret     = credentials[:consumer_secret]
        config.access_token        = credentials[:access_token]
        config.access_token_secret = credentials[:access_token_secret]
      end
      @youtube_api_key = youtube_api_key
    end

    def action(service:, type:, target:, extras: [])
      raise 'Non existing service' unless AVALAIBLE_SERVICES.include? service
      raise 'Non existing type' unless TYPES.include? type
      result = send(service).send("#{type}_content", target)
      update(result, extras)
    end

    private

    def update(args, extras)
      msg = "#{args[:title]} #{args[:url]} #{extras.join(' ')}"
      @client.update(msg)
    end

    def medium
      @medium ||= Medium.new
    end

    def youtube
      @youtube ||= Youtube.new @youtube_api_key
    end
  end
end
