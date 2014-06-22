require 'rubygems'
require 'marvelous'
require 'rspec'
require 'vcr'
require 'test/unit'
require 'simplecov'
require 'dotenv'
require 'timecop'
require 'byebug'

SimpleCov.start

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

# freeze time to allow for web requests and VCR to play nice
RSpec.configure do |config|
  config.before(:all) do
    new_time = Time.local(2014, 5, 20, 12, 0, 0)
    Timecop.freeze(new_time)
  end

  config.before(:each) do
    Dotenv.load
  end
end