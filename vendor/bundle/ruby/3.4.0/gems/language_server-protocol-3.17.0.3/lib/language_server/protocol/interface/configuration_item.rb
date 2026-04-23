module LanguageServer
  module Protocol
    module Interface
      class ConfigurationItem
        def initialize(scope_uri: nil, section: nil)
          @attributes = {}

          @attributes[:scopeUri] = scope_uri if scope_uri
          @attributes[:section] = section if section

          @attributes.freeze
        end

        #
        # The scope to get the configuration section for.
        #
        # @return [string]
        def scope_uri
          attributes.fetch(:scopeUri)
        end

        #
        # The configuration section asked for.
        #
        # @return [string]
        def section
          attributes.fetch(:section)
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
