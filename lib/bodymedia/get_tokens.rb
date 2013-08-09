###########################################################################################################
#WHAT IS IT?
#IF you are using it outside of rails, or you just want to test me,
#you should have valid tokens to do it.
#use your cons_key and cons_secret to generate keys in tokens method and put all the keys to config.yml:
#  KEY: "consumerkey"
#  SECRET: "consumersecretkey"
#  ACCESS_KEY: "accesstoken"
#  ACCESS_SECRET: "accesstokensecret"
#and have fun
###########################################################################################################
require "oauth"
require "yaml"
CONFIG = YAML.load_file("lib/bodymedia/config.yml") unless defined? CONFIG

def tokens(consumer_key, consumer_secret)
      consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {
        :site               => "https://api.bodymedia.com",
        :scheme             => :header,
        :http_method        => :post,
        :request_token_path => "/oauth/request_token",
        :access_token_path  => "/oauth/access_token",
        :authorize_path     => "/oauth/authorize"
       })
       request_token = consumer.get_request_token
       puts "You should visit url"
       puts "https://api.bodymedia.com/oauth/authorize?oauth_callback=http://localhost:3000&api_key=#{consumer_key}&oauth_token=#{request_token.token}"
       puts "If you visited it, click enter"
       gets
       access_token = request_token.get_access_token
       puts " consumer_key: #{consumer_key}"
       puts " consumer_secret: #{consumer_secret}"
       #puts " request_token: #{request_token.token}"
       puts " access_token: #{access_token.token}"
       puts " access_token_secret: #{access_token.secret}"
       response = access_token.get("http://api.bodymedia.com/v1.0/body/current?api_key=#{consumer_key}")
       puts response.body.inspect
end
tokens(CONFIG["KEY"], CONFIG["SECRET"])
###########################################################################################################
#HOW TO USE
#just create instance of class with valid params
#and have fun
#
#require "./client"
#cl = Bodymedia::Client.new(
#    :consumer_key => CONFIG['KEY'], 
#    :consumer_secret => CONFIG['SECRET'],
#    :access_token => CONFIG['ACCESS_KEY'],
#    :access_token_secret => CONFIG['ACCESS_SECRET']
#  )
#puts cl.get_parsed_data "/summary/day/20120915/20130809"
###########################################################################################################