module Whowas
  module Support 
    # :nocov:
    def valid_splunk_input
      { 
        query: "192.168.1.1 5000",
        timestamp: "2015-10-10T00:00",
        offset: -300
      }
    end
    
    def formatted_valid_splunk_input
      { 
        query: "search 192.168.1.1 5000",
        args: {
          earliest_time: "2015-10-09T19:55:00.000-0400",
          latest_time: "2015-10-09T20:00:00.100-0400"
        }
      }      
    end

    def valid_splunk_input_no_results
      { 
        query: "192.168.1.2 5000",
        timestamp: "2015-10-10T00:00",
        offset: -300
      }
    end
    
    def formatted_valid_splunk_input_no_results
      { 
        query: "search 192.168.1.2 5000",
        args: {
          earliest_time: "2015-10-09T19:55:00.000-0400",
          latest_time: "2015-10-09T20:00:00.100-0400"
        }
      }      
    end
    
    def invalid_splunk_input
      {
        query: "192.168.1.1. 5000"
      }
    end
  end
end
