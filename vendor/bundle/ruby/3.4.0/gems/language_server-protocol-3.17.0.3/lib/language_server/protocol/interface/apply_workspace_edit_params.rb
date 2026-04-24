module LanguageServer
  module Protocol
    module Interface
      class ApplyWorkspaceEditParams
        def initialize(edit:, label: nil)
          @attributes = {}

          @attributes[:label] = label if label
          @attributes[:edit] = edit

          @attributes.freeze
        end

        #
        # An optional label of the workspace edit. This label is
        # presented in the user interface for example on an undo
        # stack to undo the workspace edit.
        #
        # @return [string]
        def label
          attributes.fetch(:label)
        end

        #
        # The edits to apply.
        #
        # @return [WorkspaceEdit]
        def edit
          attributes.fetch(:edit)
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
