require 'spec_helper'

describe Marvelous::Character do
  context "initialize" do
    let(:character){ Marvelous::Character.new(id: 1, name: 'FooBar', description: 'this is a description', modified: DateTime.now) }

    it "should have id" do
      character.id.should eq 1
    end

    it "should have name" do
      character.name.should eq 'FooBar'
    end

    it "should have description" do
      character.description.should eq 'this is a description'
    end

    it "should have a modified date" do
      character.modified.should eq DateTime.now
    end
  end

  context ".all" do
    context "success" do
      it "should return an array of all characters" do
        VCR.use_cassette 'query all characters' do
          Marvelous::Character.all.should be_an_instance_of Array
        end
      end

      it "should have array contents full of Marvelous::Characters" do
        VCR.use_cassette 'query all characters' do
          Marvelous::Character.all.all? { |c| c.class == Marvelous::Character }.should be_true
        end
      end
    end
    
    context "failure" do
      before :each do
        ENV['MARVEL_PUBLIC'] = 'FooBarBaz'
      end

      it "should raise a StandardError" do
        VCR.use_cassette 'response failure' do
          expect{ Marvelous::Character.all }.to raise_error(StandardError)
        end
      end
    end
  end

  context ".where" do
    context "different queries" do
    end
    it "should return an array of characters" do
      VCR.use_cassette 'query name' do
        Marvelous::Character.where(name: 'The Hulk').should be_an_instance_of Array
      end
    end
  end

end