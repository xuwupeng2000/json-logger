require 'lograge'
require 'ougai_json/logger/custom_options'

module OugaiJson
  module Logger
    class Engine < ::Rails::Engine
      isolate_namespace OugaiJson::Logger

      initializer(:rails_stdout_logging, before: :initialize_logger) do
        Rails.application.configure do
          config.logger = OugaiJson::Logger.custom_logger(name: 'Rails')


          config.lograge.enabled = true
          config.colorize_logging = false

          config.lograge.formatter = Lograge::Formatters::Raw.new
          config.lograge.custom_options = OugaiJson::Loggger::CustomOptions
        end
      end
    end
  end
end
