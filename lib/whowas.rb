require "middleware"

require "whowas/adapter"
require "whowas/configuration"
require "whowas/errors"
require "whowas/formattable"
require "whowas/middleware"
require "whowas/parsable"
require "whowas/recipes"
require "whowas/searchable"
require "whowas/validatable"
require "whowas/version"

# bundled adapters
require "adapters/splunk"


module Whowas
  extend Configuration
  
  # TODO: create a more sophisticated system for creating and retrieving
  # recipes
  #
  # For now, users must provide their own recipes, which is a Middleware stack.
  # For documentation, see https://github.com/mitchellh/middleware
  # 
  # To create compatible middleware classes, include Whowas::Middleware.
  # This will create the necessary initialize and call classes.
  # It requires the underlying class to have a "#search" function which takes
  # a hash and returns a string.
  #
  # Recipes are automatically selected using the recipe_table attribute, which
  # can be configured by the user, and the Recipes.select algorithm.
  # 
  # For more search support, include the Whowas::Searchable module, which adds
  # validation, formatting, and parsing to the search methods.  Check the source
  # for more documentation.
  
  define_setting :recipe_table, {}
  define_setting :recipe_class, Whowas::Recipes
  
  # configuration defaults
  define_setting :splunk_config, nil  
  
  def self.search(input)
    recipe = recipe_class.select(input) || Whowas.recipe_table[:default]
    env = {input: input, results: []}
    self.send(recipe).call(env)
    env
  end
  
  private
  
  # Uses the recipe_table hash to match up the input to the correct recipe type.
  # If there is an IP address in the input, it tries to match the IP address
  # against any keys that are valid CIDR blocks.
  # If there is a mac address, it looks for the key :mac.
  # Otherwise, it falls back to :default.
  def select_recipe(input)
  end
    
end
