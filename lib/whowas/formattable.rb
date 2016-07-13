module Whowas
  module Formattable
    def format(input)
      format_input(input)
    end
    
    # :nocov:
    private
    # This is a hook for the including class to use to modify the input before
    # the adapter gets it.
    #
    # By default, this method just returns the arguments given, but note that
    # most classes _will have_ to modify the input to make it usable by the
    # adapter.
    def format_input(input)
      input
    end
  end
end