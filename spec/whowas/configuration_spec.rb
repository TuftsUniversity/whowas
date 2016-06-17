require "spec_helper"

describe Whowas::Configuration do
  describe "#configuration" do
    before do
      module DummyModule
        extend Whowas::Configuration
      end
    end    
    
    it "yields itself" do
      new_instance = nil
      DummyModule.configuration { |config| new_instance = config }
      expect(new_instance).to be DummyModule
    end
  end
  
  describe "#define_setting" do
    before do
      module DummyModule
        extend Whowas::Configuration
        
        define_setting(:test_method, true)
      end
    end    
    
    it "sets a class variable" do
      expect(DummyModule).to respond_to(:test_method)
    end
    
    it "creates a setter method" do
      expect(DummyModule).to respond_to(:test_method=)
    end
    
    it "creates a getter method" do
      expect(DummyModule).to respond_to(:test_method)
    end
    
    it "assigns default value if provided" do
      expect(DummyModule.test_method).to eq true
    end
  end
end