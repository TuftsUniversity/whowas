require "middleware"

module Whowas
  def self.name_this_recipe
    # All you have to do is specify the search method classes in the order
    # they should be called.  The output for each search method should match
    # the input of the next.
    ::Middleware::Builder.new do
      # use MySearchMethod1
      # use MySearchMethod2
      # use MySearchMethod3
    end
  end
end
