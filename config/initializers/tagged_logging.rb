# frozen_string_literal: true

module ActiveSupport
  module TaggedLogging
    # Patch to apply structured tags to Tagged Logs
    module Formatter
      def call(severity, timestamp, progname, data)
        super(severity, timestamp, progname, merged_tags.merge!(data))
      end

      private

      def merged_tags
        tags = {}

        current_tags.each do |tag|
          tags.merge!(tag) if tag.is_a?(Hash)
        end

        tags
      end
    end
  end
end

module Rails
  module Rack
    # Patch to compute structured tags for Tagged Logging
    class Logger
      private

      def compute_tags(request)
        {
          trace_id: request.uuid
        }
      end
    end
  end
end
