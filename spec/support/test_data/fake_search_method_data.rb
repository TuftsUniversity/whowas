module Whowas
  module Support
    # ::nocov::
    def valid_input_results
      { ip: "192.168.1.1", timestamp: "2015-10-10T00:00", port: "5000" }
    end
    
    def valid_input_no_results
      { ip: "192.168.1.2", timestamp: "2015-10-10T00:00", port: "5000" }
    end
    
    def valid_input_some_results
      { ip: "192.168.1.3", timestamp: "2015-10-10T00:00", port: "5000" }
    end
    
    def invalid_input
      { ip: "192.168.1.1" }      
    end
  end
end