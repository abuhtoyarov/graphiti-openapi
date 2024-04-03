require "graphiti/open_api"

module Graphiti
  module OpenAPI
    class Resources < Hash
      # @param [<ResourceData>]
      def self.load(schema, data = schema.__attributes__[:resources])
        data.each_with_object(new) do |resource, result|
          result[resource.name] = Resource.new(resource.to_hash.merge(schema: schema))
        end
      end

      def by_model(model)
        fetch("#{model}Resource")
      end

      def by_type(type)
        values.detect { |resource| resource.type = type }
      end
    end
  end
end
