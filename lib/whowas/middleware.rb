module Whowas
  module Middleware
    def initialize(app = nil)
      @app = app
    end
    
    def call(env)
      env[:results] ||= Array.new
      if results = self.search(env[:input])
        if results[:raw] && !results[:raw].empty?
          env[:results] << {results[:method] => results[:raw]}
          env[:input] = results[:input].merge({timestamp: env[:input][:timestamp]})
          @app.call(env) unless !@app
        else
          env[:results] << { results[:method] => "No results found." }
        end
      end
      env[:results]
    rescue Whowas::Error => e
      env[:error] = e
    end
  end
end   