module LanguageServer
  module Protocol
    module Interface
      class SemanticTokensLegend
        def initialize(token_types:, token_modifiers:)
          @attributes = {}

          @attributes[:tokenTypes] = token_types
          @attributes[:tokenModifiers] = token_modifiers

          @attributes.freeze
        end

        #
        # The token types a server uses.
        #
        # @return [string[]]
        def token_types
          attributes.fetch(:tokenTypes)
        end

        #
        # The token modifiers a server uses.
        #
        # @return [string[]]
        def token_modifiers
          attributes.fetch(:tokenModifiers)
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
