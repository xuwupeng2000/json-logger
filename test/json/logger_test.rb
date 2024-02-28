require 'test_helper'

class OugaiJson::Logger::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, OugaiJson::Logger
    logger = OugaiJson::Logger::Logger.custom_logger(name: 'Rails')
    assert_kind_of OugaiJson::Logger::Logger, logger
  end
end
