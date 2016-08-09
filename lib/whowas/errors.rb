module Whowas
  # A base error class for Whowas.  Most of the errors that will be thrown
  # from Whowas will inherit from this class.
  class Error < StandardError  
  end
  
  module Errors
    # Will be thrown when Whowas is not configured or configured improperly.
    class ConfigurationError < Whowas::Error
    end
    
    # Will be thrown when input is invalid.
    class InvalidInput < Whowas::Error
    end
    
    # Will be thrown when an external service is unavailable.
    class ServiceUnavailable < Whowas::Error
    end
    
    # Will be thrown when a subclass or including class doesn't define
    # a required method.
    class SubclassResponsibility < Whowas::Error
    end
  end
end