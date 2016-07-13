require "splunk-sdk-ruby"

module Whowas
  class Splunk
    include Whowas::Adapter
    
    @@connection = nil
    
    private
    
    # Whowas.splunk_config is configured via define_setting in the initializer.
    # See configuration.rb for more information.
    def self.connection(config: Whowas.splunk_config)
      @@connection ||= ::Splunk::connect(config)
    rescue => e
      raise Whowas::Errors::ServiceUnavailable, "#{self.class.name}: #{e}"
    end
        
    def validate(input)
      (input[:query] && 
      !input[:query].empty? && 
      input[:offset].is_a?(Integer) &&
      DateTime.parse(input[:timestamp]) &&
      true) ||
      (raise Whowas::Errors::InvalidInput, "Invalid input for Splunk")
    end
    
    def format(input)
      input = {
        query: "search #{input[:query]}",
        args: {
          earliest_time: format_timestamp(input[:timestamp], input[:offset]),
          latest_time: format_timestamp(input[:timestamp], 0.1)
        }
      }
    end
    
    def format_timestamp(timestamp, offset)
      (DateTime.parse(timestamp).to_time + offset).strftime("%Y-%m-%dT%H:%M:%S.%L%z")
    end
    
    def search_api(input)
      puts input
      stream = self.class.connection.create_export(input[:query], input[:args])
      if results = ::Splunk::MultiResultsReader.new(stream).first.first
        results["_raw"]
      else
        ""
      end
    end
  end
end