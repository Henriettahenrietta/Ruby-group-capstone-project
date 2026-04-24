module LanguageServer
  module Protocol
    module Interface
      class InitializedParams
        def initialize()
          @attributes = {}


          @attributes.freeze
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
