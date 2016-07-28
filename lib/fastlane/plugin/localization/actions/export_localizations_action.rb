module Fastlane
  module Actions
    class ExportLocalizationsAction < Action
      def self.run(params)
        destination_path = params[:destination_path]
        project = params[:project]

        UI.message("Exporting localizations from #{project} to #{destination_path} folder")

        sh "xcodebuild -exportLocalizations -localizationPath #{destination_path} -project #{project}"
      end

      def self.description
        "Export app localizations with help of xcodebuild -exportLocalizations tool"
      end

      def self.authors
        ["Viktor Malyi"]
      end

      def self.available_options
        [
           FastlaneCore::ConfigItem.new(key: :destination_path,
                                   env_name: "DESTINATION_PATH",
                                description: "Destination path where XLIFF will be exported to",
                                   optional: false,
                                       type: String),
           FastlaneCore::ConfigItem.new(key: :project,
                                   env_name: "PROJECT",
                                description: "Project to export localizations from",
                                   optional: false,
                                       type: String),
        ]
      end

      def self.is_supported?(platform)
          [:ios, :mac].include?(platform)
          true
      end
    end
  end
end
