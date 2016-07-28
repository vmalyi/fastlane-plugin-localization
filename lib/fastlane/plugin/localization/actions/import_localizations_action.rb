module Fastlane
  module Actions
    class ImportLocalizationsAction < Action
      def self.run(params)
        source_path = params[:source_path]
        project = params[:project]

        UI.message("Importing localizations from #{source_path} folder to #{project} project")

        sh "xcodebuild -importLocalizations -localizationPath #{source_path} -project #{project}"
      end

      def self.description
        "Import app localizations with help of xcodebuild -importLocalizations tool"
      end

      def self.authors
        ["Viktor Malyi"]
      end

      def self.available_options
        [
           FastlaneCore::ConfigItem.new(key: :source_path,
                                   env_name: "SOURCE_PATH",
                                description: "Destination path to XLIFF file which will be imported",
                                   optional: false,
                                       type: String),
           FastlaneCore::ConfigItem.new(key: :project,
                                   env_name: "PROJECT",
                                description: "Project to import localizations to",
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
