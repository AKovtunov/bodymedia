require "spec_helper"
CONFIG = YAML.load_file("lib/bodymedia/config.yml") unless defined? CONFIG

describe Bodymedia::Client do
  let(:client){Bodymedia::Client.new(
	  :consumer_key => CONFIG['KEY'], 
	  :consumer_secret => CONFIG['SECRET'],
	  :access_token => CONFIG['ACCESS_KEY'],
	  :access_token_secret => CONFIG['ACCESS_SECRET']
	)}
  it "should have access to activities for today" do
  	behaves_like_hash client.get_activity_for_today
  end
  it "should have access to activities for choosen date" do
  	behaves_like_hash client.get_activity_for("20130805")
  end
  it "should have access to activities for some period of time" do
  	behaves_like_hash client.get_activity_for_period("20120106", "20130105")
  end
  xit "should count if range > than 365 and raise an error" do
  	expect{client.get_activity_for("20110805","20150807")}.to raise_error
  end
end