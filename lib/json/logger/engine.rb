module Json
  module Logger
    class Engine < ::Rails::Engine
      isolate_namespace Json::Logger

      initializer(:rails_stdout_logging, before: :initialize_logger) do
        Rails.application.configure do
          config.logger = Json::Logger::Logger.custom_logger(name: 'Rails')

          require 'lograge'
          require 'json/logger/custom_options'

          config.lograge.enabled = true
          config.colorize_logging = false

          config.lograge.formatter = Lograge::Formatters::Raw.new
          config.lograge.custom_options = Json::Loggger::CustomOptions
        end
      end
    end
  end
end
