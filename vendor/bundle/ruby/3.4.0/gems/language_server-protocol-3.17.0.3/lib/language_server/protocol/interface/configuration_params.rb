module LanguageServer
  module Protocol
    module Interface
      class ConfigurationParams
        def initialize(items:)
          @attributes = {}

          @attributes[:items] = items

          @attributes.freeze
        end

        # @return [ConfigurationItem[]]
        def items
          attributes.fetch(:items)
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
