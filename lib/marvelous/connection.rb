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
      connection.get("#{endpoint}#{auth_params}")
    end

    def auth_params
      "?ts=#{Time.now.to_i}&apikey=#{ENV['MARVEL_PUBLIC']}&hash=#{auth_hash}"    
    end

    def auth_hash 
      Digest::MD5.hexdigest "#{Time.now.to_i}#{ENV['MARVEL_PRIVATE']}#{ENV['MARVEL_PUBLIC']}"
    end
  end
end