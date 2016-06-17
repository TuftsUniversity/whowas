require "simplecov"
SimpleCov.start do
  nocov_token 'nocov'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'whowas'

require "pry-byebug"

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.include Whowas::Support
end