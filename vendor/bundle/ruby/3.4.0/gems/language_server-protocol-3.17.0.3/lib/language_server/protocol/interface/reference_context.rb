module LanguageServer
  module Protocol
    module Interface
      class ReferenceContext
        def initialize(include_declaration:)
          @attributes = {}

          @attributes[:includeDeclaration] = include_declaration

          @attributes.freeze
        end

        #
        # Include the declaration of the current symbol.
        #
        # @return [boolean]
        def include_declaration
          attributes.fetch(:includeDeclaration)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*)
          to_hash.to_json(*)
        end
      end
    end
  end
end
