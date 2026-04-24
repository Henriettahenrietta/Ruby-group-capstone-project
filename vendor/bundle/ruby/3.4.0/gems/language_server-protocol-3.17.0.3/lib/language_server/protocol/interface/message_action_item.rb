module LanguageServer
  module Protocol
    module Interface
      class MessageActionItem
        def initialize(title:)
          @attributes = {}

          @attributes[:title] = title

          @attributes.freeze
        end

        #
        # A short title like 'Retry', 'Open Log' etc.
        #
        # @return [string]
        def title
          attributes.fetch(:title)
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
