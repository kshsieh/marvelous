require 'spec_helper'

describe Marvelous::Connection do
  let(:connection){ Marvelous::Connection.instance }

  context "initialize" do
    it "should create a Faraday Connection" do
      connection.connection.should be_an_instance_of Faraday::Connection
    end
  end

  context "auth_params" do
    before :each do
      ENV['MARVEL_PUBLIC']  = '12345'
      Digest::MD5.stub(:hexdigest).and_return('foobarbaz')
    end

    it "should return the proper string" do
      connection.auth_params.should eq "ts=#{Time.now.to_i}&apikey=12345&hash=foobarbaz"
    end
  end

  context "auth_hash" do
    before :each do
      ENV['MARVEL_PUBLIC']  = '12345'
      ENV['MARVEL_PRIVATE'] = 'abcdef'
    end

    it "should pass in proper string to create digest" do
      Digest::MD5.should_receive(:hexdigest).with("#{Time.now.to_i}abcdef12345")
      connection.auth_hash
    end
  end
end