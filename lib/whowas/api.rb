module Whowas
  module Api
    # All APIs use (api_instance).search as the only public method
    # and follow the pattern below.
    # Validation and formatting are optional.
    # search_api must contain the core api search code and return the results.
    def search(input)
      validate(input)
      input = format(input)
      search_api(input)
    end
  
    private
  
    # default methods for APIs to use or override
    #:nocov:
    def validate(input)
      true
    end
    
    def format(input)
      input
    end
    
    # MUST be overridden (core search functionality)
    def search_api(input)
      raise Errors::SubclassResponsibility
    end
  end 
end