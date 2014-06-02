require 'spec_helper'

describe Marvelous::Character do
  context ".where" do
    it "should return an array of characters" do
      Marvelous::Character.where(name: 'The Hulk').should be_an_instance_of Array
    end
  end
end