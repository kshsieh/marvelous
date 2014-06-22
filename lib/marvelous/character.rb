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
      characters = []
      response = Marvelous::Connection.get uri

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

    def self.where attrs
      characters = []
      params = "" 
      attrs.keys.each { |k| params += "#{k.to_s}=#{attrs[k]}&" }

      response = Marvelous::Connection.get uri, params

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