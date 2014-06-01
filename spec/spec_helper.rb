require 'rubygems'
require 'marvelous'
require 'rspec'
require 'vcr'
require 'test/unit'
require 'simplecov'
SimpleCov.start

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end