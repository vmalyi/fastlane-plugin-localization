module Fastlane
  module Actions
    class ExportLocalizationsAction < Action
      def self.run(params)

        #
        xcodeproj_path = params[:xcodeproj]
        destination_path = params[:destination_path]
        languages = params[:languages] ? params[:languages].split(",") : []

        #
        UI.message("Exporting localizations from #{xcodeproj_path} to #{destination_path} folder")

        #
        command = "xcodebuild -exportLocalizations "
        command << "-localizationPath #{destination_path} "
        command << "-project #{xcodeproj_path} "
        languages.each { |language| command << "-exportLanguage #{language} " }

        #
        Fastlane::Actions.sh command, log: true

      end

      def self.description
        "Export app localizations with help of xcodebuild -exportLocalizations tool"
      end

      def self.authors
        ["vmalyi"]
      end

      def self.available_options
        [
           FastlaneCore::ConfigItem.new(key: :destination_path,
                                   env_name: "FL_LOCALIZATIONS_DESTINATION_PATH",
                                description: "Destination path where XLIFF will be exported to",
                                   optional: true,
                              default_value: "xliffs"),
           FastlaneCore::ConfigItem.new(key: :xcodeproj,
                                   env_name: "FL_LOCALIZATIONS_PROJECT",
                                description: "Project to export localizations from",
                              default_value: Dir["*.xcodeproj"].first,
                               verify_block: proc do |value|
                                         UI.user_error!("Please pass the path to the project, not the workspace") if value.end_with? ".xcworkspace"
                                         UI.user_error!("Could not find Xcode project") unless File.exist?(value)
                                       end),
           FastlaneCore::ConfigItem.new(key: :languages,
                                   env_name: "FL_LOCALIZATIONS_EXPORT_LANGUAGES",
                                description: "List of languages to export",
                                   optional: true,
                                       type: String),
        ]
      end

      def self.example_code
        [
          'export_localizations(xcodeproj: "Project.xcodeproj", destination_path: "localizations", languages: "en,pl")'
        ]
      end

      def self.is_supported?(platform)
          true
      end
    end
  end
end
