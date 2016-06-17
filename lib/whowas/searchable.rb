module Whowas
  module Searchable    
    @@api = nil
    
    # The including class *must* set the api class in a class constant.
    def api
      @@api || (raise Errors::SubclassResponsibility)
    end

    # extend the including class with the searchable sub-modules
    def self.included klass
      klass.class_eval do
        include Validatable
        include Formattable
        include Parsable
      end
    end
    
    def search(input)
      validate(input)
      input = format(input)
      result = api.new.search(input)
      parse(result)
    end
  end
end    