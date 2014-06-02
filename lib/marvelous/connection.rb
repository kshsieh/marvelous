require 'faraday'
require 'singleton'
require 'digest/md5'

module Marvelous
  class Connection
    include Singleton
    attr_accessor :connection

    def initialize
      @connection = Faraday.new(url: 'http://gateway.marvel.com/') do |faraday|
                      faraday.request  :url_encoded
                      faraday.response :logger
                      faraday.adapter  Faraday.default_adapter
                    end
    end

    def get endpoint
      endpoint + Time.now.to_i
    end

    def auth_params
      "?ts=#{Time.now.to_i}&api_key=#{ENV['MARVEL_PUBLIC']}&hash=#{auth_hash}"    
    end

    def auth_hash 
      Digest::MD5.hexdigest "#{Time.now.to_i}#{ENV['MARVEL_PUBLIC']}#{ENV['MARVEL_PRIVATE']}"
    end
  end
end