require 'faraday'
require 'singleton'

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
  end
end