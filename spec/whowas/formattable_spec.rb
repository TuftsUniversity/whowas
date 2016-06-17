require "spec_helper"

module Whowas
  describe Formattable, type: :searchable do
    let(:dummy_class) { Support::FakeSearchMethod }
    
    describe "#format" do
      it "converts it to the format the API requires" do
        expect(dummy_class.new.format(valid_input_results)).to include(
          {
            query: "search 192.168.1.1 5000",
            timestamp: "2015-10-10T00:00",
            offset: -300              
          }
        )
      end
    end
  end
end