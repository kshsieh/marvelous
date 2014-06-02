module Marvelous
  class Character
    attr_accessor :name

    def self.where attrs
      Marvelous::Connection.get '/v1/public/characters'
    end

    def initialize
    end

  end
end