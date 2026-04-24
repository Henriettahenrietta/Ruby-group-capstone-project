module LanguageServer
  module Protocol
    module Interface
      class CancelParams
        def initialize(id:)
          @attributes = {}

          @attributes[:id] = id

          @attributes.freeze
        end

        #
        # The request id to cancel.
        #
        # @return [string | number]
        def id
          attributes.fetch(:id)
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
