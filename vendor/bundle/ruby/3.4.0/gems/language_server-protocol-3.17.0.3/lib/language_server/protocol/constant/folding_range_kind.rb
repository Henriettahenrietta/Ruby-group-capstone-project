module LanguageServer
  module Protocol
    module Constant
      #
      # A set of predefined range kinds.
      # The type is a string since the value set is extensible
      #
      module FoldingRangeKind
        #
        # Folding range for a comment
        #
        COMMENT = 'comment'.freeze
        #
        # Folding range for imports or includes
        #
        IMPORTS = 'imports'.freeze
        #
        # Folding range for a region (e.g. `#region`)
        #
        REGION = 'region'.freeze
      end
    end
  end
end
