describe Fastlane::Actions::WaitXcrunAction do
  describe '#run' do
    if FastlaneCore::Helper.mac?
      it 'prints a message when running on macos' do
        expect(Fastlane::UI).to receive(:message).with("Waiting for Xcode toolchain ...")
        Fastlane::Actions::WaitXcrunAction.run(nil)
      end
    else
      it 'does nothing on os other than macos' do
        expect(Fastlane::UI).to receive(:important).with("xcrun command does not exist")
        Fastlane::Actions::WaitXcrunAction.run(nil)
      end
    end
  end
end
