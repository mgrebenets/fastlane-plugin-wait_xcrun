module Fastlane
  module Actions
    class WaitXcrunAction < Action
      def self.run(params)
        unless system("command -v xcrun")
          UI.important("xcrun command does not exist")
          return
        end

        UI.message "Waiting for Xcode toolchain ..."
        # Try running 'xcrun simctl help' subcommand until exit status is 0 or max number or retries is exceeded
        retry_count = 0
        loop do
          system("xcrun simctl help 2>/dev/null 1>/dev/null")
          break if $?.success? || retry_count >= 10

          UI.important("Xcode toochain is not ready yet. Retrying ...")
          sleep(1) # Take a short break
          retry_count += 1
        end

        $?.success? ? UI.success("Xcode toolchain is back online!") : UI.user_error!("Xcode toolchain is offline.")
      end

      def self.description
        "Wait for Xcode toolchain to come back online after switching Xcode versions."
      end

      def self.details
        [
          "This action helps fixing the following issue:",
          "- Launch Xcode 8 simulator",
          "- Run any 'xcrun simctl' sub-command using Xcode 7.3.1 toolchain",
          "",
          "In most cases the 'xcrun' command will cause an exception and will return exit code 134."
        ].join("\n")
      end

      def self.authors
        ["mgrebenets"]
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?(platform)
      end
    end
  end
end
