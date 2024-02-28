Rails.application.routes.draw do
  mount OugaiJson::Logger::Engine => "/ougai-json-logger"
end
