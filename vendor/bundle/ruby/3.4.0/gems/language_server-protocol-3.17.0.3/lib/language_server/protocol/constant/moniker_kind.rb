module LanguageServer
  module Protocol
    module Constant
      #
      # The moniker kind.
      #
      module MonikerKind
        #
        # The moniker represent a symbol that is imported into a project
        #
        IMPORT = 'import'.freeze
        #
        # The moniker represents a symbol that is exported from a project
        #
        EXPORT = 'export'.freeze
        #
        # The moniker represents a symbol that is local to a project (e.g. a local
        # variable of a function, a class not visible outside the project, ...)
        #
        LOCAL = 'local'.freeze
      end
    end
  end
end
