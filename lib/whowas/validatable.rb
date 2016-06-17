module Whowas
  module Validatable 
    # Checks for required inputs and input formats
    # that the API will need to process the search.
    #
    # It does *not* matter if there are other, non-required parameters
    # in the input hash; they will be ignored later.
    def validate(input)
      (check_exists(required_inputs, input) &&
        check_format(input_formats, input)) || 
      (raise Errors::InvalidInput, "Invalid input for #{self.class.name}")
    end
    
    # :nocov: 
    private
    
    # hooks for required_inputs and input_formats
    # must be set by including class
    def required_inputs
      []
    end
    
    def input_formats
      {}
    end

    # Required keys must exist in the input hash and must have a non-nil,
    # non-empty value.
    def check_exists(required, input)
      required.inject(true) do |result, key|
        input[key] && result
      end
    end
    
    # Format is a lambda defined in the api class which returns true or false.
    # This allows for flexible format checking:
    #    e.g. regex for ip addresses and DateTime.parse calls for timestamps
    def check_format(formats, input)
      formats.inject(true) do |result, (key, format)|
        format.call(input[key]) && result
      end
    end    
  end
end
    