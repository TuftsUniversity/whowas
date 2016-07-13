require "spec_helper"

shared_examples "an_adapter" do  
  describe "#search" do
    let(:adapter) { described_class.new }
    
    let!(:service) { described_class.name.split("::").last.downcase }
    let(:valid_adapter_input) { send("valid_#{service}_input") }
    let(:valid_adapter_input_no_results) { send("valid_#{service}_input_no_results") }
    let(:invalid_adapter_input) { send("invalid_#{service}_input") }

    context "with valid input" do      
      before do
        service_up(described_class)
      end
    
      it "returns a result string if there is a match" do
        expect(adapter.search(valid_adapter_input)).to eq "raw results string"
      end
      
      it "returns an empty string if there is no match" do
        expect(adapter.search(valid_adapter_input_no_results)).to eq ""
      end
    end
    
    context "with invalid input" do
      before do
        service_up(described_class)
      end
          
      it "raises Errors::InvalidInput" do
        expect{adapter.search(invalid_adapter_input)}.to raise_error(Whowas::Errors::InvalidInput)
      end
    end
    
    context "when the service is down or experiencing problems" do
      before do
        service_down(described_class)
      end
      
      it "raises Errors::Service Unavailable" do
        expect{adapter.search(valid_adapter_input)}.to raise_error(Whowas::Errors::ServiceUnavailable)
      end
    end
  end
end