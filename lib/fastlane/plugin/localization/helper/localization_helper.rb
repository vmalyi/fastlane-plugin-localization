module Fastlane
  module Helper
    class LocalizationHelper
      # class methods that you define here become available in your action
      # as `Helper::LocalizationHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the localization plugin helper!")
      end
    end
  end
end
