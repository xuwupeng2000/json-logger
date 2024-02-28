# frozen_string_literal: true

module OugaiJson
  module Logger
    class Formatter < Ougai::Formatters::Bunyan
      def _call(severity, time, progname, data)
        payload = base_fields(data, severity, time, progname)
        payload[:error] = error_fields(data)
        payload[:request] = request_fields(data)
        payload[:response] = response_fields(data)
        payload[:process] = process_fields(data)
        payload[:url] = url_fields(data)
        payload[:event] = event_fields(data)
        dump(payload)
      end

      # Ougai::Formatters::ForJson requires this be present
      def convert_time(data)
        data[:@timestamp] = data[:@timestamp].utc.iso8601(3)
      end

      private

      def base_fields(data, severity, time, progname)
        {
          :@timestamp => time,
          message: data[:msg],
          log: { level: severity, logger: progname || @app_name },
          trace: { id: data[:trace_id] }
        }
      end

      def error_fields(data)
        return {} unless data[:error] || data[:err]

        error = data[:err] || serialize_exc(data[:error])

        {
          message: error[:message],
          stack_trace: error[:stack],
          type: error[:name]
        }.compact
      end

      def request_fields(data)
        request = data.slice(:method, :params).merge(data.fetch(:request, {}))

        {
          method: request[:method],
          body: ({ content: request[:params] } if request.key? :params)
        }.compact
      end

      def response_fields(data)
        response = data.slice(:status).merge(data.fetch(:response, {}))

        {
          status_code: response[:status],
          body: ({ content: response[:params] } if response.key? :params),
        }.compact
      end

      def process_fields(_data)
        { id: Process.pid }
      end

      # url
      def url_fields(data)
        {
          full: data.dig(:url, :full),
          path: data[:path]
        }.compact
      end

      # controller and action
      def event_fields(data)
        full_action = "#{data[:controller]}##{data[:action]}"

        {
          action: (full_action unless full_action == '#'),
          duration: data[:duration]
        }.compact
      end
    end

  end
end
