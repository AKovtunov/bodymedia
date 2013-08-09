require "spec_helper"
CONFIG = YAML.load_file("lib/bodymedia/config.yml") unless defined? CONFIG

describe Bodymedia::Client do
  let(:client){Bodymedia::Client.new(
    :consumer_key => CONFIG['KEY'], 
    :consumer_secret => CONFIG['SECRET'],
    :access_token => CONFIG['ACCESS_KEY'],
    :access_token_secret => CONFIG['ACCESS_SECRET']
  )}

  it "should get current measurements" do
  	behaves_like_hash client.get_current_measurements
  end
  it "should get measurements by date" do
    behaves_like_hash client.get_measurements("WEIGHT", "20130806")
  end
  it "should get measurements by params" do
    behaves_like_hash client.get_measurements("WEIGHT")
  end
  xit "POST measurements" do end
end