require 'active_record'

module Temping
  def self.included(base)
    unless ActiveRecord::Base.connected?
      ActiveRecord::Base.configurations['temping'] = { 
        :adapter  => 'sqlite3', :database => ':memory:'
      }    
      ActiveRecord::Base.establish_connection 'temping' 
    end
  end
  
  def create_model(model_name, module_name=:object, superklass=ActiveRecord::Base, &block)    
    model_class = model_name.to_s.classify
    model_module = module_name.to_s.classify
    unless eval("defined?(#{model_module}::#{model_class})")
      factory = ModelFactory.new(model_class, model_module, superklass, &block)
      factory.klass
    end
  end

  class ModelFactory
    attr_accessor :klass
    
    def initialize(model_class, model_module=:object, superklass, &block)
      @klass = Class.new(superklass)
      @modewl = Module.new
      if eval("defined?(#{model_module})")
        @modewl = model_module.constantize
      else
        Object.const_set(model_module, @modewl)
      end
      @modewl.const_set(model_class, @klass)
      create_table
      add_methods
      @klass.class_eval(&block) if block_given?
    end

    private

      def create_table
        @klass.connection.create_table(@klass.table_name, :temporary => true) do |table| 
          table.integer :id
        end
      end

      def add_methods
        class << @klass
          def with_columns
            connection.change_table(table_name) { |table| yield(table) }
          end

          def table_exists?
            true
          end
        end
      end
    
  end   
end