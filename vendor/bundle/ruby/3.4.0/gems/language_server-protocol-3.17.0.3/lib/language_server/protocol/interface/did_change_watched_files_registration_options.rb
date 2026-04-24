module LanguageServer
  module Protocol
    module Interface
      #
      # Describe options to be used when registering for file system change events.
      #
      class DidChangeWatchedFilesRegistrationOptions
        def initialize(watchers:)
          @attributes = {}

          @attributes[:watchers] = watchers

          @attributes.freeze
        end

        #
        # The watchers to register.
        #
        # @return [FileSystemWatcher[]]
        def watchers
          attributes.fetch(:watchers)
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
