module LanguageServer
  module Protocol
    module Constant
      #
      # The document diagnostic report kinds.
      #
      module DocumentDiagnosticReportKind
        #
        # A diagnostic report with a full
        # set of problems.
        #
        FULL = 'full'.freeze
        #
        # A report indicating that the last
        # returned report is still accurate.
        #
        UNCHANGED = 'unchanged'.freeze
      end
    end
  end
end
