require 'test_helper'

class SMSSenderTest < Test::Unit::TestCase

  def test_if_runtime_exception_is_thrown_on_wrong_credentials
    sms = MoSms::SMSSender.new("falseUser", "falsePassword")

    assert_raise RuntimeError do
      sms.send("072123123", :text, "This is my message")
    end
  end

end