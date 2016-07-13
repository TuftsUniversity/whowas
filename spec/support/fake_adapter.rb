module Whowas
  module Support
    class FakeAdapter
    end
    
    def setup_fake_adapter_class      
      # Searchable
      valid_formatted_input_results = {query: "search 192.168.1.1 5000", timestamp: "2015-10-10T00:00", offset: -300}
      valid_formatted_input_no_results = {query: "search 192.168.1.2 5000", timestamp: "2015-10-10T00:00", offset: -300}
      valid_formatted_input_some_results = {query: "search 192.168.1.3 5000", timestamp: "2015-10-10T00:00", offset: -300}
      
      allow_any_instance_of(FakeAdapter).to receive(:search).and_raise(Whowas::Errors::InvalidInput)        
      allow_any_instance_of(FakeAdapter).to receive(:search).with(hash_including(valid_formatted_input_results)).and_return("A string of text including a mac (01:23:45:ab:cd:ef) addr")
      allow_any_instance_of(FakeAdapter).to receive(:search).with(hash_including(valid_formatted_input_some_results)).and_return("A string of text including a mac (01:23:45:ab:cd:ef) addr")      
      allow_any_instance_of(FakeAdapter).to receive(:search).with(hash_including(valid_formatted_input_no_results)).and_return("")
      
    end
  end
end