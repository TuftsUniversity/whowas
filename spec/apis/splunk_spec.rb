require "spec_helper"
require "whowas/api_shared"

module Whowas
  describe Splunk, type: :api do
    it_behaves_like "an_api"
  end
end