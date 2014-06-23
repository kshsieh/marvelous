module Marvelous
  class Character
    attr_accessor :id, :name, :description, :modified #, :thumbnail

    def initialize attrs
      @id          = attrs[:id]
      @name        = attrs[:name]
      @description = attrs[:description]
      @modified    = attrs[:modified]
    end

    def self.uri
      '/v1/public/characters'
    end

    def self.all
      handle_response Marvelous::Connection.get uri
    end

    def self.where attrs
      params = "" 

      attrs.keys.each { |k| params += "#{k.to_s}=#{attrs[k]}&" }

      handle_response Marvelous::Connection.get uri, params
    end

    def self.handle_response response
      characters = []
      
      if response.success?
        hash = JSON.parse(response.body).with_indifferent_access
        results = hash[:data][:results]

        results.each do |result|
          characters << Marvelous::Character.new(result)
        end

        characters
      else
        raise StandardError
      end
    end
  end
end