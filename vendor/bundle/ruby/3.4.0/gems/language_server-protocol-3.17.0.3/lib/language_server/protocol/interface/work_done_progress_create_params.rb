module LanguageServer
  module Protocol
    module Interface
      class WorkDoneProgressCreateParams
        def initialize(token:)
          @attributes = {}

          @attributes[:token] = token

          @attributes.freeze
        end

        #
        # The token to be used to report progress.
        #
        # @return [ProgressToken]
        def token
          attributes.fetch(:token)
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
