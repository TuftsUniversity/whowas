require "spec_helper"

module Whowas
  describe Searchable, type: :searchable do
    before do
      setup_fake_adapter_class
    end
    
    describe "#search" do
      let(:searcher) { Support::FakeSearchMethod.new }
      
      context "when the search succeeds" do
        it "returns a results hash if there are matches" do
          expect(searcher.search(valid_input_results)).to eq(
            {
              raw: "A string of text including a mac (01:23:45:ab:cd:ef) addr",
              input: {
                mac: "01:23:45:ab:cd:ef"
              },
              method: "Whowas::Support::FakeSearchMethod"
            }
          )
        end
        
        it "returns an empty results hash if there are no matches" do
          expect(searcher.search(valid_input_no_results)).to eq(
            {
              raw: "",
              input: {},
              method: "Whowas::Support::FakeSearchMethod"
            }
          )
        end
      end
      
      context "when the search fails" do
        it "raises InvalidInput with bad input" do
          expect{searcher.search(invalid_input)}.to raise_error(
            Errors::InvalidInput
          )
        end
      end
    end
  end
end