# frozen_string_literal: true

module Json
  module Loggger
    module CustomOptions
      class << self
        def call(event)
          items = {
            msg: 'Rails Request',
            params: event.payload[:params].as_json.to_s,
            trace_id: event.payload[:headers]['HTTP_X_REQUEST_ID'],
            error: event.payload[:exception_object]
          }
          items.merge({ headers: event.payload[:headers] }) if event.payload[:headers].present?
        end
      end
    end
  end
end
