module LanguageServer
  module Protocol
    module Constant
      #
      # Moniker uniqueness level to define scope of the moniker.
      #
      module UniquenessLevel
        #
        # The moniker is only unique inside a document
        #
        DOCUMENT = 'document'.freeze
        #
        # The moniker is unique inside a project for which a dump got created
        #
        PROJECT = 'project'.freeze
        #
        # The moniker is unique inside the group to which a project belongs
        #
        GROUP = 'group'.freeze
        #
        # The moniker is unique inside the moniker scheme.
        #
        SCHEME = 'scheme'.freeze
        #
        # The moniker is globally unique
        #
        GLOBAL = 'global'.freeze
      end
    end
  end
end
