require "ipaddr"

module Whowas
  class Recipes
    def self.select(input)
      if input[:ip]
        select_by_ip(input[:ip])
      elsif input[:mac]
        Whowas.recipe_table[:mac_default]
      end
    end
    
    private
    
    def self.select_by_ip(ip)
      ip = IPAddr.new(ip)
      
      results = Whowas.recipe_table.select do |key, value|
        if subnet = (IPAddr.new(key.to_s) rescue nil)
          subnet.include?(ip)
        end
      end
      
      if results.empty?
        Whowas.recipe_table[:ip_default]
      else
        results.values.first
      end
    end
  end
end
    