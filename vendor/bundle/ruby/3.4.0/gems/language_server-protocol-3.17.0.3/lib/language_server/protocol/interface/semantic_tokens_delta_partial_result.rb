module LanguageServer
  module Protocol
    module Interface
      class SemanticTokensDeltaPartialResult
        def initialize(edits:)
          @attributes = {}

          @attributes[:edits] = edits

          @attributes.freeze
        end

        # @return [SemanticTokensEdit[]]
        def edits
          attributes.fetch(:edits)
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
