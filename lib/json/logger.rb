require 'ougai'
require 'mono_logger'
require 'json/logger/formatter'
require "json/logger/engine"

module Json
  module Logger
    class Logger < Ougai::Logger
      def initialize(logdev, **)
        super
        @logdev = MonoLogger::LocklessLogDevice.new(logdev)
      end

      def create_formatter
        return Json::Logger::Formatter.new
      end

      def self.custom_logger(name: '', level: Rails.logger.present? ? Rails.logger.level : MonoLogger::INFO, type: :ougai)
        new($stdout, level: level, progname: name)
      end
    end
  end
end
