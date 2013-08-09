require "spec_helper"
CONFIG = YAML.load_file("lib/bodymedia/config.yml") unless defined? CONFIG

describe Bodymedia::Client do
  let(:valid_client){Bodymedia::Client.new(
      :consumer_key => CONFIG['KEY'], 
      :consumer_secret => CONFIG['SECRET'],
      :access_token => CONFIG['ACCESS_KEY'],
      :access_token_secret => CONFIG['ACCESS_SECRET']
    )}
  let(:invalid_client){Bodymedia::Client.new(
      :consumer_key => CONFIG['KEY'], 
      :access_token => CONFIG['ACCESS_KEY'],
      :access_token_secret => CONFIG['ACCESS_SECRET']
    )}
  it "should be valid with valid params" do
    expect(valid_client).to be_an_instance_of Bodymedia::Client
    expect{valid_client}.not_to raise_error
  end
  it "should not be valid with invalid params" do
    expect{invalid_client}.to raise_error
  end

end