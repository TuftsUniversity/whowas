module Whowas
  module Formattable
    def format(input)
      format_input(input)
    end
    
    # :nocov:
    private
    # This is a hook for the including class to use to modify the input before
    # the api gets it.
    #
    # For example, when searching in Splunk, the Firewall class (which includes
    # Searchable) must create the query string from the ip and port, plus any
    # other parameters like the Splunk index it wants to search.
    #
    # By default, this method just returns the arguments given, but note that
    # most classes _will have_ to modify the input to make it usable by the
    # API modification method.
    def format_input(input)
      input
    end
  end
end