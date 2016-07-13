require 'spec_helper'

module Whowas
  def self.fake_recipe_1
    ::Middleware::Builder.new do
     use Whowas::Support::FakeSearchMethod.new
     use Whowas::Support::FakeSearchMethod.new
    end
  end
  
  def self.fake_recipe_2
    ::Middleware::Builder.new do
     use Whowas::Support::FakeSearchMethod.new
    end    
  end
end

describe Whowas, type: :main do
  it 'has a version number' do
    expect(Whowas::VERSION).not_to be nil
  end
  
  describe ".search" do
    before do
      setup_fake_api_class
      Whowas::Support::FakeSearchMethod.send(:include, Whowas::Middleware)
      Whowas.configuration do |config|
        config.recipe_table = {
          # using the middleware twice causes it to succeed on the first call
          # and error on the second due to invalid input
          # (FakeSearchMethod takes an IP but produces a MAC)
          "192.168.1.3": "fake_recipe_1",
          "default": "fake_recipe_2"
        }
      end
    end
    
    context "when results are found" do
      it "env contains the results" do
        expect(Whowas.search(valid_input_results)[:results]).to eq [
          {"Whowas::Support::FakeSearchMethod"=>"A string of text including a mac (01:23:45:ab:cd:ef) addr"}     
        ]
      end
    end
    
    context "when no results are found" do
      it "env contains a no results found message" do
        expect(Whowas.search(valid_input_no_results)[:results]).to eq [
          {"Whowas::Support::FakeSearchMethod"=>"No results found."}
        ]
      end
    end
    
    context "when there is an error" do
      it "env contains an error message" do
        expect(Whowas.search(invalid_input)[:error]).to be_a Whowas::Error
      end
    end
    
    context "when the first step returns results but the second step errors" do
      it "env contains results and an error message" do
        expect(Whowas.search(valid_input_some_results)[:error]).to be_a Whowas::Errors::InvalidInput
        expect(Whowas.search(valid_input_some_results)[:results]).to eq [
          {"Whowas::Support::FakeSearchMethod"=>"A string of text including a mac (01:23:45:ab:cd:ef) addr"},
        ]
      end
    end    
  end
end
