module Graphiti
  module OpenAPI
    class ResourceData < Struct
      attribute :name, Types::String
      attribute :type, Types::String
      attribute :description, Types::String.optional
      attribute :attributes, Types::Hash.map(Types::Symbol, AttributeData)
      attribute :extra_attributes, Types::Hash.map(Types::Symbol, AttributeData)
      attribute :sorts, Types::Hash.map(Types::Symbol, Types::Hash)
      attribute :filters, Types::Hash.map(Types::Symbol, Types::Hash)
      attribute :relationships, Types::Hash.map(Types::Symbol, RelationshipData)

      def relationships
        Relationships.load(self)
      end

      def relationships?
        relationships.any?
      end

      memoize :relationships
    end
  end
end
