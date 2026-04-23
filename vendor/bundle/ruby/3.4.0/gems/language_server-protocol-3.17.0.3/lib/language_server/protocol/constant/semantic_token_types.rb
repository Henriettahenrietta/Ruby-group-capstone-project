module LanguageServer
  module Protocol
    module Constant
      module SemanticTokenTypes
        NAMESPACE = 'namespace'.freeze
        #
        # Represents a generic type. Acts as a fallback for types which
        # can't be mapped to a specific type like class or enum.
        #
        TYPE = 'type'.freeze
        CLASS = 'class'.freeze
        ENUM = 'enum'.freeze
        INTERFACE = 'interface'.freeze
        STRUCT = 'struct'.freeze
        TYPE_PARAMETER = 'typeParameter'.freeze
        PARAMETER = 'parameter'.freeze
        VARIABLE = 'variable'.freeze
        PROPERTY = 'property'.freeze
        ENUM_MEMBER = 'enumMember'.freeze
        EVENT = 'event'.freeze
        FUNCTION = 'function'.freeze
        METHOD = 'method'.freeze
        MACRO = 'macro'.freeze
        KEYWORD = 'keyword'.freeze
        MODIFIER = 'modifier'.freeze
        COMMENT = 'comment'.freeze
        STRING = 'string'.freeze
        NUMBER = 'number'.freeze
        REGEXP = 'regexp'.freeze
        OPERATOR = 'operator'.freeze
        DECORATOR = 'decorator'.freeze
      end
    end
  end
end
