module LanguageServer
  module Protocol
    module Interface
      #
      # A literal to identify a notebook document in the client.
      #
      class NotebookDocumentIdentifier
        def initialize(uri:)
          @attributes = {}

          @attributes[:uri] = uri

          @attributes.freeze
        end

        #
        # The notebook document's URI.
        #
        # @return [string]
        def uri
          attributes.fetch(:uri)
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
