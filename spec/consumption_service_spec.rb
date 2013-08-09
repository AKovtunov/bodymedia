require "spec_helper"
CONFIG = YAML.load_file("lib/bodymedia/config.yml") unless defined? CONFIG

describe Bodymedia::Client do
  let(:client){Bodymedia::Client.new(
    :consumer_key => CONFIG['KEY'], 
    :consumer_secret => CONFIG['SECRET'],
    :access_token => CONFIG['ACCESS_KEY'],
    :access_token_secret => CONFIG['ACCESS_SECRET']
  )}

  it "should get consumption for today" do
    behaves_like_hash client.get_consumption_for_today
  end
  it "should get macro consumption for today" do
    behaves_like_hash client.get_consumption_for_today(:micro)
  end
  it "should get micro consumption for today" do
    behaves_like_hash client.get_consumption_for_today(:macro)
  end
  it "should get consumption for day" do
    behaves_like_hash client.get_consumption_for("20130308")
  end
  it "should get macro consumption for day" do
    behaves_like_hash client.get_consumption_for("20130308", :micro)
  end
  it "should get micro consumption for day" do
    behaves_like_hash client.get_consumption_for("20130308", :macro)
  end
  it "should get consumption for period" do
    behaves_like_hash client.get_consumption_for_period("20120902", "20130901")
  end
  it "should get consumption for period daily" do
    behaves_like_hash client.get_consumption_for_period("20120902", "20130901", :daily)
  end
  it "should get consumption for period daily micro" do
    behaves_like_hash client.get_consumption_for_period("20120902", "20130901", :daily, :micro)
  end
  it "should get consumption for period daily macro" do
    behaves_like_hash client.get_consumption_for_period("20120902", "20130901", :daily, :macro)
  end
  it "should get consumption for period daily with meal and food stats" do
    behaves_like_hash client.get_consumption_for_period("20120902", "20130901", :daily, :meal, :food)
  end
  xit "should get consumption for period daily with meal stats" do
    behaves_like_hash client.get_consumption_for_period("20120902", "20130901", :daily, :meal)
  end
  xit "should get consumption for period daily with meal macro and food micro stats" do
    behaves_like_hash client.get_consumption_for_period("20120902", "20130901", :daily, :macro, :meal_macro, :food_micro)
  end
  xit "PUT" do end
  xit "POST" do end
  xit "DELETE" do end
end