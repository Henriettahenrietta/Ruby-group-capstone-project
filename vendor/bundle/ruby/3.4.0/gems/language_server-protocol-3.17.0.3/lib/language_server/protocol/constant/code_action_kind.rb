module LanguageServer
  module Protocol
    module Constant
      #
      # The kind of a code action.
      #
      # Kinds are a hierarchical list of identifiers separated by `.`,
      # e.g. `"refactor.extract.function"`.
      #
      # The set of kinds is open and client needs to announce the kinds it supports
      # to the server during initialization.
      # A set of predefined code action kinds.
      #
      module CodeActionKind
        #
        # Empty kind.
        #
        EMPTY = ''.freeze
        #
        # Base kind for quickfix actions: 'quickfix'.
        #
        QUICK_FIX = 'quickfix'.freeze
        #
        # Base kind for refactoring actions: 'refactor'.
        #
        REFACTOR = 'refactor'.freeze
        #
        # Base kind for refactoring extraction actions: 'refactor.extract'.
        #
        # Example extract actions:
        #
        # - Extract method
        # - Extract function
        # - Extract variable
        # - Extract interface from class
        # - ...
        #
        REFACTOR_EXTRACT = 'refactor.extract'.freeze
        #
        # Base kind for refactoring inline actions: 'refactor.inline'.
        #
        # Example inline actions:
        #
        # - Inline function
        # - Inline variable
        # - Inline constant
        # - ...
        #
        REFACTOR_INLINE = 'refactor.inline'.freeze
        #
        # Base kind for refactoring rewrite actions: 'refactor.rewrite'.
        #
        # Example rewrite actions:
        #
        # - Convert JavaScript function to class
        # - Add or remove parameter
        # - Encapsulate field
        # - Make method static
        # - Move method to base class
        # - ...
        #
        REFACTOR_REWRITE = 'refactor.rewrite'.freeze
        #
        # Base kind for source actions: `source`.
        #
        # Source code actions apply to the entire file.
        #
        SOURCE = 'source'.freeze
        #
        # Base kind for an organize imports source action:
        # `source.organizeImports`.
        #
        SOURCE_ORGANIZE_IMPORTS = 'source.organizeImports'.freeze
        #
        # Base kind for a 'fix all' source action: `source.fixAll`.
        #
        # 'Fix all' actions automatically fix errors that have a clear fix that
        # do not require user input. They should not suppress errors or perform
        # unsafe fixes such as generating new types or classes.
        #
        SOURCE_FIX_ALL = 'source.fixAll'.freeze
      end
    end
  end
end
