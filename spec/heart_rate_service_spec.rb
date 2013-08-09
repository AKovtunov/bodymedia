require "spec_helper"
CONFIG = YAML.load_file("lib/bodymedia/config.yml") unless defined? CONFIG

describe Bodymedia::Client do
  let(:client){Bodymedia::Client.new(
    :consumer_key => CONFIG['KEY'], 
    :consumer_secret => CONFIG['SECRET'],
    :access_token => CONFIG['ACCESS_KEY'],
    :access_token_secret => CONFIG['ACCESS_SECRET']
  )}

  it "should get heartrate for period" do
  	behaves_like_hash client.get_heartrate_for_period("20120908", "20130808")
  end
  it "should get heartrate for period daily" do
    behaves_like_hash client.get_heartrate_for_period("20120908", "20130808", :daily)
  end
  it "should get heartrate for period for session" do
    behaves_like_hash client.get_heartrate_for_period("20130710", "20130808", :session)
  end
  it "should get heartrate for period detailed" do
    behaves_like_hash client.get_heartrate_for_period("20130715", "20130715", :detailed)
  end
  xit "should have zones" do
    #later
  end
end