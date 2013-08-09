require "bodymedia/version"
require "json"
require "oauth"
require "bodymedia/helpers"
require "bodymedia/activity_log"
require "bodymedia/burn_service"
require "bodymedia/callback_service"
require "bodymedia/consumption_service"
require "bodymedia/goal_service"
require "bodymedia/heart_rate_service"
require "bodymedia/measurement_service"

module Bodymedia
  class Client

    def initialize(args)
      missing = [:consumer_key, :consumer_secret, :access_token, :access_token_secret] - args.keys
      if missing.size > 0
        raise ArgumentError, "Missing required options: #{missing.join(',')}"
      end
      @consumer_key = args[:consumer_key]
      @consumer_secret = args[:consumer_secret]
      @access_token = args[:access_token]
      @access_token_secret = args[:access_token_secret]
      consumer = OAuth::Consumer.new(@consumer_key, @consumer_secret, {:site=>'https://api.bodymedia.com'})
      @accesstoken = OAuth::AccessToken.new(consumer, @access_token, @access_token_secret)
    end

  end
end