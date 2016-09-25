describe Fastlane::Actions::WaitXcrunAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The wait_xcrun plugin is working!")

      Fastlane::Actions::WaitXcrunAction.run(nil)
    end
  end
end
