require "spec_helper"
CONFIG = YAML.load_file("lib/bodymedia/config.yml") unless defined? CONFIG

describe Bodymedia::Client do
  let(:client){Bodymedia::Client.new(
    :consumer_key => CONFIG['KEY'], 
    :consumer_secret => CONFIG['SECRET'],
    :access_token => CONFIG['ACCESS_KEY'],
    :access_token_secret => CONFIG['ACCESS_SECRET']
  )}

  it "should get goals by type" do
  	behaves_like_hash client.get_goals("DAILY_VIG_MIN")
  end

  it "should get goals by type and date" do
	behaves_like_hash client.get_goals("DAILY_CAL_INTAKE", "20130408")
  end

  it "should get current goals" do
  	behaves_like_hash client.get_current_goals
  end


end