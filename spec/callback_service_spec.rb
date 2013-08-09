require "spec_helper"
CONFIG = YAML.load_file("lib/bodymedia/config.yml") unless defined? CONFIG

describe Bodymedia::Client do
  let(:client){Bodymedia::Client.new(
    :consumer_key => CONFIG['KEY'], 
    :consumer_secret => CONFIG['SECRET'],
    :access_token => CONFIG['ACCESS_KEY'],
    :access_token_secret => CONFIG['ACCESS_SECRET']
  )}
  
  xit "should have code for callback" do
    puts client.get_callback
  end
end