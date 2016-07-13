module Whowas
  class ApiGenerator < Rails::Generators::NamedBase
    source_root File.expand_path("../templates", __FILE__)
    
    def create
      copy_file "api.rb", "app/whowas/apis/#{file_name}.rb"
    end
    
    def rename_class
      gsub_file "app/whowas/apis/#{file_name}.rb", /MyApi/, name.camelize
    end
  end
end
