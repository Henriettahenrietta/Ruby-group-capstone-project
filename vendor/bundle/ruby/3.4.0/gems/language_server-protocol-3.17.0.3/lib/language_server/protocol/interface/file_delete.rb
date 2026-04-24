module LanguageServer
  module Protocol
    module Interface
      #
      # Represents information on a file/folder delete.
      #
      class FileDelete
        def initialize(uri:)
          @attributes = {}

          @attributes[:uri] = uri

          @attributes.freeze
        end

        #
        # A file:// URI for the location of the file/folder being deleted.
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
