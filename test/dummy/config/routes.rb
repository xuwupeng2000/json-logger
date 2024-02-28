Rails.application.routes.draw do
  mount Json::Logger::Engine => "/json-logger"
end
