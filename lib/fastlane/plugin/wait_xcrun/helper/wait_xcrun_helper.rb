module Fastlane
  module Helper
    class WaitXcrunHelper
      # class methods that you define here become available in your action
      # as `Helper::WaitXcrunHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the wait_xcrun plugin helper!")
      end
    end
  end
end
