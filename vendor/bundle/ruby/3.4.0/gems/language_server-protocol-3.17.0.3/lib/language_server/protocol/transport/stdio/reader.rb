module LanguageServer
  module Protocol
    module Transport
      module Stdio
        class Reader < Io::Reader
          def initialize
            super $stdin
          end
        end
      end
    end
  end
end
