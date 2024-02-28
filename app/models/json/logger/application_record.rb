module OugaiJson
  module Logger
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
