require "spec_helper"

module Whowas
  describe Validatable, type: :searchable do
    let(:dummy_class) { Support::FakeSearchMethod }
    
    describe "#validate" do
      context "when given input that meets the requirements of the adapter" do
        it "returns true" do
          expect(dummy_class.new.validate(valid_input_results)).to be true
        end
      end
      context "when given invalid or insufficient input" do
        it "raises InvalidInput" do
          expect{dummy_class.new.validate(invalid_input)}.to raise_error(Errors::InvalidInput)
        end
      end
    end
  end
end