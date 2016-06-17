# WhoWas configuration options
Whowas.configuration do |config|
  ## Recipe Table
  # You MUST define your default recipe and any other recipes you may use
  # here.  Viable keys include "default", "ip_default", "mac_default", and
  # valid IP addresses or CIDR blocks.
  #
  # An example of a full recipe table:
  #
  # config.recipe_table = {
  #   "192.168.1.0/24": MyRecipes.home_wireless,
  #   "10.0.0.0/8": MyRecipes.internal_wired,
  #   ip_default: MyRecipes.other_ips,
  #   mac_default: MyRecipes.search_by_mac,
  #   default: MyRecipes.other_ips
  # }
  config.recipe_table = {}
  
  ## API configuration and credentials
  # If you are not using a bundled API, you can safely ignore this section.

  # Splunk API configuration
  # The recommended method is to store your Splunk credentials in environment
  # variables using a gem such as dotenv.
  #
  # config.splunk_config = {
  #   scheme: :https,
  #   host: ENV['SPLUNK_HOST'],
  #   port: ENV['SPLUNK_PORT'],
  #   username: ENV['SPLUNK_USERNAME'],
  #   password: ENV['SPLUNK_PASSWORD']
  # }
  #
  config.splunk_config = {}
end