module Whowas
  module Parsable
    # Parses a raw result into a hash including the raw result and
    # other data extracted from the raw result to be used as potential inputs
    # for other searches.
    #
    # Example:
    # Given the raw string "I am a string, but I also have an IP -- 192.168.1.1"
    # The result should be:
    #   { 
    #     raw: "I am a string, but I also have an IP -- 192.168.1.1",
    #     input: { ip: "192.168.1.1" } 
    #   }
    def parse(raw)
      {
        raw: raw,
        input: parse_for_input(raw),
        method: self.class.name
      }
    end
    
    # :nocov:
    private
    
    def parse_for_input(raw)
      if raw && !raw.empty?
        output_formats.map { |k, v| [k, raw[v]] }.to_h.delete_if{ |k, v| v.nil? }
      else
        {}
      end
    end
    
    # A hook for each including class to define the input names and formats the
    # parser should look for in the raw result.
    #
    # This should be a hash of name -> regex, for example:
    # {
    #    ip: /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/,
    #    username: /Username=\K\w*/
    # }
    def input_formats
      {}
    end
  end
end