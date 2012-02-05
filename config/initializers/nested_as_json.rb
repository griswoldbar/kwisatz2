module ActiveRecord #:nodoc:
  module Serialization

    def serializable_hash(options = nil)
      options = options.try(:clone) || {}

      options[:except] = Array.wrap(options[:except]).map { |n| n.to_s }
      options[:except] |= Array.wrap(self.class.inheritance_column)

      hash = super(options)

      #serializable_add_includes(options) do |association, records, opts|
        #hash[association] = records.is_a?(Enumerable) ?
        #records.map { |r| r.serializable_hash(opts) } :
        #records.serializable_hash(opts)
      #end

      serializable_add_includes(options) do |association, records, opts|
        hash[association] = records.is_a?(Enumerable) ?
          records.map { |r| r.as_json(opts.merge(:no_root => true)) } :
          records.as_json(opts.merge(:no_root => true))
      end

      hash
    end
  end
end

module ActiveModel
  # == Active Model JSON Serializer
  module Serializers
    module JSON

      def as_json(options = nil)
        hash = serializable_hash(options)

        if include_root_in_json and !options[:no_root]
          custom_root = options && options[:root]
          hash = { custom_root || self.class.model_name.element => hash }
        end

        hash
      end

    end
  end
end