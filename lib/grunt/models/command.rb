module Grunt
  module Models
    class Command
      include MongoMapper::Document
      
      set_collection_name "commands"
      
      key :name, String, :required => true
      key :body, String, :required => true
      key :desc, String
      key :usage, String
      key :help, Array
      key :type, String, :required => true
      key :events, Array
      key :created_by, String
      key :updated_by, String
      timestamps!

      ensure_index :name, :unique => true
      
      validates_format_of :name, :with => /^[a-zA-Z0-9_]+$/,
                          :message => "may contain only alphanumeric characters and underscores"
      validates_uniqueness_of :name
    end
  end
end