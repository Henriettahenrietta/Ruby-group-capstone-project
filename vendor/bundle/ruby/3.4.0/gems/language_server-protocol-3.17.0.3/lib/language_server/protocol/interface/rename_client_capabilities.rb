module LanguageServer
  module Protocol
    module Interface
      class RenameClientCapabilities
        def initialize(dynamic_registration: nil, prepare_support: nil, prepare_support_default_behavior: nil,
                       honors_change_annotations: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration if dynamic_registration
          @attributes[:prepareSupport] = prepare_support if prepare_support
          if prepare_support_default_behavior
            @attributes[:prepareSupportDefaultBehavior] =
              prepare_support_default_behavior
          end
          @attributes[:honorsChangeAnnotations] = honors_change_annotations if honors_change_annotations

          @attributes.freeze
        end

        #
        # Whether rename supports dynamic registration.
        #
        # @return [boolean]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # Client supports testing for validity of rename operations
        # before execution.
        #
        # @return [boolean]
        def prepare_support
          attributes.fetch(:prepareSupport)
        end

        #
        # Client supports the default behavior result
        # (`{ defaultBehavior: boolean }`).
        #
        # The value indicates the default behavior used by the
        # client.
        #
        # @return [1]
        def prepare_support_default_behavior
          attributes.fetch(:prepareSupportDefaultBehavior)
        end

        #
        # Whether the client honors the change annotations in
        # text edits and resource operations returned via the
        # rename request's workspace edit by for example presenting
        # the workspace edit in the user interface and asking
        # for confirmation.
        #
        # @return [boolean]
        def honors_change_annotations
          attributes.fetch(:honorsChangeAnnotations)
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
