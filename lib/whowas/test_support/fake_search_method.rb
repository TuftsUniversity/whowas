require "support/fake_adapter"

module Whowas
  module TestSupport
    class FakeSearchMethod
      include Searchable
      
      ADAPTER = Whowas::Support::FakeAdapter
      
      private
      
      # the fake adapter class needs a query string, a timestamp, and an offset
      # for the timestamp in seconds to create a time range to search
      def format_input(input)
        input[:query]  = "search #{input[:ip]} #{input[:port]}"
        input[:offset] = -300
        input
      end
      
      # required inputs
      def required_inputs
        [:ip, :timestamp, :port]
      end
      
      def input_formats
        {
          ip: lambda{ |input| (input =~ /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/) && true},
          timestamp: lambda { |input| DateTime.parse(input) && true rescue false }
        }
      end
      
      def output_formats
        {
          mac: /([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})/,
          username: /username \(\K\w*/
        }
      end
  
    end
  end
end