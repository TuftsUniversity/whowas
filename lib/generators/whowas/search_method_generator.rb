module Whowas
  class SearchMethodGenerator < Rails::Generators::NamedBase
    source_root File.expand_path("../templates", __FILE__)
    
    def create
      copy_file "search_method.rb", "app/search_methods/#{file_name}.rb"
    end
    
    def rename_class
      gsub_file "app/search_methods/#{file_name}.rb", /MySearchMethod/, name.camelize
    end
  end
end