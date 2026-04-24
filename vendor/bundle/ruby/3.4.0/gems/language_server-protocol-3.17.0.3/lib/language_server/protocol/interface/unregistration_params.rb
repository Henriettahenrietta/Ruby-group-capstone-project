module LanguageServer
  module Protocol
    module Interface
      class UnregistrationParams
        def initialize(unregisterations:)
          @attributes = {}

          @attributes[:unregisterations] = unregisterations

          @attributes.freeze
        end

        # @return [Unregistration[]]
        def unregisterations
          attributes.fetch(:unregisterations)
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
