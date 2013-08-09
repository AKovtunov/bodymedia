require "spec_helper"
CONFIG = YAML.load_file("lib/bodymedia/config.yml") unless defined? CONFIG

describe Bodymedia::Client do
  let(:client){Bodymedia::Client.new(
	  :consumer_key => CONFIG['KEY'], 
	  :consumer_secret => CONFIG['SECRET'],
	  :access_token => CONFIG['ACCESS_KEY'],
	  :access_token_secret => CONFIG['ACCESS_SECRET']
	)}
  it "should have access to burn stats for today" do
  	behaves_like_hash client.get_burn_for_today
  end
  it "should have access to burn stats for choosen date" do
  	behaves_like_hash client.get_burn_for("20130805")
  end
  it "should have access to burn stats for some period of time" do
  	behaves_like_hash client.get_burn_for_period("20120106", "20130105")
  end
  it "should have access to burn stats for each day in some period of time" do
    behaves_like_hash client.get_burn_for_period("20120106", "20130105", :daily)
  end
  it "should have access to burn stats for each minute in a day" do
    behaves_like_hash client.get_burn_for("20120106", :minutes)
  end
  it "should have access to burn stats for each minute in a day in a some period of time" do
    behaves_like_hash client.get_burn_for_period("20120106", "20130105", :daily, :minutes)
  end
  it "should have access to burn stats for today with intensity" do
    behaves_like_hash client.get_burn_for_today(:intensity)
  end
  it "should have access to burn stats for choosen date intensity" do
    behaves_like_hash client.get_burn_for("20130805", :intensity)
  end
  it "should have access to burn stats for some period of time intensity" do
    behaves_like_hash client.get_burn_for_period("20120106", "20130105", :intensity)
  end
  it "should have access to burn stats for each day in some period of time intensity" do
    behaves_like_hash client.get_burn_for_period("20120106", "20130105", :daily, :intensity)
  end
  it "should have access to burn stats for each minute in a day intensity" do
    behaves_like_hash client.get_burn_for("20120106", :minutes, :intensity)
  end
  it "should have access to burn stats for each minute in a day in a some period of time intensity" do
    behaves_like_hash client.get_burn_for_period("20120106", "20130105", :daily, :minutes, :intensity)
  end
  xit "should count if range > than 365 and raise an error" do
  	expect{client.get_burn_for("20110805","20150807")}.to raise_error
  end
end