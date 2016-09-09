module Whowas
  module Support
    # Stub the Splunk instance
    # In real practice, the Splunk::connect method would return a
    # ::Splunk::Service object; however, it's easier to stub everything off of
    # ::Splunk, and the internal Splunk workings shouldn't make a difference 
    # in the tests.
    class SplunkService
    end
    
    def splunk_up
      service = SplunkService.new
      
      allow(::Splunk).to receive(:connect).and_return(service)
      allow(::Splunk::Service).to receive(:new).and_return(service)
      
      # valid splunk input with results
      allow(service).to receive(:create_export)
        .with(formatted_valid_splunk_input[:query], formatted_valid_splunk_input[:args])
        .and_return("raw results stream")
      allow(::Splunk::MultiResultsReader).to receive(:new).with("raw results stream")
      .and_return([["_raw" => "raw results string"]])
      
      # valid splunk input with no results
      allow(service).to receive(:create_export)
        .with(formatted_valid_splunk_input_no_results[:query], formatted_valid_splunk_input_no_results[:args])
        .and_return("empty stream")
      allow(::Splunk::MultiResultsReader).to receive(:new).with("empty stream")
      .and_return([[nil]])
      
      allow_any_instance_of(SplunkService).to receive(:token).and_return("fake_token")    
    end
    
    def splunk_down
      Whowas::Splunk.class_variable_set(:@@connection, nil)
      allow(::Splunk).to receive(:connect).and_raise(
        Whowas::Errors::ServiceUnavailable, "Could not connect to Splunk"
      )           
    end
  end
end