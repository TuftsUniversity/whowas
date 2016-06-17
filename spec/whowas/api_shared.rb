require "spec_helper"

shared_examples "an_api" do  
  describe "#search" do
    let(:api) { described_class.new }
    
    let!(:service) { described_class.name.split("::").last.downcase }
    let(:valid_api_input) { send("valid_#{service}_input") }
    let(:valid_api_input_no_results) { send("valid_#{service}_input_no_results") }
    let(:invalid_api_input) { send("invalid_#{service}_input") }

    context "with valid input" do      
      before do
        service_up(described_class)
      end
    
      it "returns a result string if there is a match" do
        expect(api.search(valid_api_input)).to eq "raw results string"
      end
      
      it "returns an empty string if there is no match" do
        expect(api.search(valid_api_input_no_results)).to eq ""
      end
    end
    
    context "with invalid input" do
      before do
        service_up(described_class)
      end
          
      it "raises Errors::InvalidInput" do
        expect{api.search(invalid_api_input)}.to raise_error(Whowas::Errors::InvalidInput)
      end
    end
    
    context "when the service is down or experiencing problems" do
      before do
        service_down(described_class)
      end
      
      it "raises Errors::Service Unavailable" do
        expect{api.search(valid_api_input)}.to raise_error(Whowas::Errors::ServiceUnavailable)
      end
    end
  end
end