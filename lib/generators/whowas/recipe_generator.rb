module Whowas
  class RecipeGenerator < Rails::Generators::NamedBase
    source_root File.expand_path("../templates", __FILE__)
    
    def create
      copy_file "recipe.rb", "app/recipes/#{file_name}.rb"
    end
    
    def rename_method
      gsub_file "app/recipes/#{file_name}.rb", /name_this_recipe/, name.underscore
    end
  end
end