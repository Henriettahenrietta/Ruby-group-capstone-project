module LanguageServer
  module Protocol
    module Interface
      #
      # Cancellation data returned from a diagnostic request.
      #
      class DiagnosticServerCancellationData
        def initialize(retrigger_request:)
          @attributes = {}

          @attributes[:retriggerRequest] = retrigger_request

          @attributes.freeze
        end

        # @return [boolean]
        def retrigger_request
          attributes.fetch(:retriggerRequest)
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
