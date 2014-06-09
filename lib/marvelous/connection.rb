require 'faraday'
require 'singleton'
require 'digest/md5'
require 'json'

module Marvelous
  class Connection
    include Singleton
    attr_accessor :connection

    def initialize
      @connection = Faraday.new(url: 'http://gateway.marvel.com/') do |faraday|
                      faraday.request  :url_encoded
                      faraday.adapter  Faraday.default_adapter
                    end
    end

    def self.get endpoint
      connection.get("#{endpoint}#{instance.auth_params}")
    end

    def auth_params
      "?ts=#{Time.now.to_i}&apikey=#{ENV['MARVEL_PUBLIC']}&hash=#{auth_hash}"    
    end

    def auth_hash 
      Digest::MD5.hexdigest "#{Time.now.to_i}#{ENV['MARVEL_PRIVATE']}#{ENV['MARVEL_PUBLIC']}"
    end

    # overrides class methods to allow calls to Singleton without calling instance
    def self.respond_to? method, include_private=false
      instance.respond_to?(method, include_private) || super
    end

    def self.method_missing method, *args, &block
      return super unless respond_to? method
      instance.send method, *args, &block
    end
  end
end