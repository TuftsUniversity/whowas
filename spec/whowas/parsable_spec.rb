require "spec_helper"

module Whowas
  describe Parsable, type: :searchable do
    let(:dummy_class) { Support::FakeSearchMethod }
    
    describe "#parse" do
      let!(:raw) { "A raw result including some useful information, such as a \
        mac address (00:14:22:ab:cd:ef) and a username (jsmith)." }
      let!(:raw_empty) { "A raw result with no parsable inputs." }
      let(:results) { dummy_class.new.parse(raw) }
      
      it "returns a results hash" do
        expect(results).to be_a Hash
      end
      
      it "puts the raw results into results[:raw]" do
        expect(results[:raw]).to eq(raw)
      end
  
      context "when there are potential inputs in the raw results" do
        it "parses out the inputs and puts them into results[:input]" do
          expect(results[:input]).to eq({mac: "00:14:22:ab:cd:ef", username: "jsmith"})
        end       
      end
      
      context "when there are no potential inputs in the raw results" do
        it "results[:input] should be an empty hash" do
          expect(dummy_class.new.parse(raw_empty)[:input]).to eq({})
        end
      end

    end
  end
end