module LanguageServer
  module Protocol
    module Constant
      #
      # A pattern kind describing if a glob pattern matches a file a folder or
      # both.
      #
      module FileOperationPatternKind
        #
        # The pattern matches a file only.
        #
        FILE = 'file'.freeze
        #
        # The pattern matches a folder only.
        #
        FOLDER = 'folder'.freeze
      end
    end
  end
end
