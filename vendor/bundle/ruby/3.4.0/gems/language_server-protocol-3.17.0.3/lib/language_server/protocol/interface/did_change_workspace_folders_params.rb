module LanguageServer
  module Protocol
    module Interface
      class DidChangeWorkspaceFoldersParams
        def initialize(event:)
          @attributes = {}

          @attributes[:event] = event

          @attributes.freeze
        end

        #
        # The actual workspace folder change event.
        #
        # @return [WorkspaceFoldersChangeEvent]
        def event
          attributes.fetch(:event)
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
