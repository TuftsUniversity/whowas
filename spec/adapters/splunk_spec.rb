require "spec_helper"
require "whowas/adapter_shared"

module Whowas
  extend Configuration
  
  define_setting :splunk_config, {}
  
  describe Splunk, type: :adapter do
    it_behaves_like "an_adapter"
  end
end