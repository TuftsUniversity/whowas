module Whowas
  class MyAdapter
    # Whowas::Adapter provides the public interface to your adapter, accessed 
    # through the "search" instance method.
    include Whowas::Adapter
  
    # All custom adapter code is defined in the private methods below.  
    # Naturally, you can add private methods as needed for connecting to the 
    # adapter, etc. 
    private
    
    ## Required
    
    # Sends a search query with provided input to your third-party API and 
    # returns results as a string.
    def search_api(input)
      ""
    end
   
    ## Optional
    
    # Validates input to avoid unnecessary API calls.
    # MUST return true or raise a Whowas::Errors::InvalidInput error.
    # Replace "true" with your validation code.
    def validate(input)
      true ||
      (raise Whowas::Errors::InvalidInput, "Invalid input for #{self.class.name}")
    end
    
    # Transforms input one last time before API call.
    # Will be called on input for all search_methods using this adapter.
    # For search_method-specific transformations, use the format_input method
    # in your search_method.
    def format(input)
      input
    end
  end
end