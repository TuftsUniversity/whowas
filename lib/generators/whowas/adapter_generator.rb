module Whowas
  class AdapterGenerator < Rails::Generators::NamedBase
    source_root File.expand_path("../templates", __FILE__)
    
    def create
      copy_file "adapter.rb", "app/whowas/adapters/#{file_name}.rb"
    end
    
    def rename_class
      gsub_file "app/whowas/adapters/#{file_name}.rb", /MyAdapter/, name.camelize
    end
  end
end
