describe Fastlane::Actions::LocalizationAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The localization plugin is working!")

      Fastlane::Actions::LocalizationAction.run(nil)
    end
  end
end
