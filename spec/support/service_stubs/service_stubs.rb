module Whowas
  module Support  
    def service_up(service)
      self.send("#{service.name.split("::").last.downcase}_up")
    end
    
    def service_down(service)
      self.send("#{service.name.split("::").last.downcase}_down")      
    end
  end
end