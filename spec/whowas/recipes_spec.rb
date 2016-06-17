require "spec_helper"

module Whowas
  describe Recipes, focus: true do
    describe "#select" do
      before do
        Whowas.configuration do |config|
          config.recipe_table = {
            "192.168.100.0/24":"vpn",
            "ip_default": "wifi1",                     
            "mac_default": "ipam",
            "default": "default"
          }
        end
      end
      
      context "when given input including an IP address" do
        it "finds a recipe by CIDR block first" do
          expect(Recipes.select({ip: "192.168.100.30"})).to eq("vpn")
        end
        it "returns the default IP recipe second" do
          expect(Recipes.select({ip: "192.168.200.30"})).to eq("wifi1")
        end       
      end
      context "when given a mac address" do
        it "returns the default mac recipe first" do
          expect(Recipes.select({mac: "mac address"})).to eq("ipam")
        end
      end
      context "when given anything else" do
        it "returns nil" do
          expect(Recipes.select({random_input: "random"})).to eq(nil)
        end          
      end
    end
  end
end