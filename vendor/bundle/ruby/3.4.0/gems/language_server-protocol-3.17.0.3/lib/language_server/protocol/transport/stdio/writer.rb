module LanguageServer
  module Protocol
    module Transport
      module Stdio
        class Writer < Io::Writer
          def initialize
            super $stdout
          end
        end
      end
    end
  end
end
