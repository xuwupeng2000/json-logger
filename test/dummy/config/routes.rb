Rails.application.routes.draw do
  mount OugaiJson::Logger::Engine => "/json-logger"
end
