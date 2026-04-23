module LanguageServer
  module Protocol
    module Constant
      #
      # The kind of resource operations supported by the client.
      #
      module ResourceOperationKind
        #
        # Supports creating new files and folders.
        #
        CREATE = 'create'.freeze
        #
        # Supports renaming existing files and folders.
        #
        RENAME = 'rename'.freeze
        #
        # Supports deleting existing files and folders.
        #
        DELETE = 'delete'.freeze
      end
    end
  end
end
