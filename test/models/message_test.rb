require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test "user can create message" do
    user = users(:dave)
    message = Message.new(message_body: "Did you call the shelter?")
    message.user_id = user.id
    assert_equal 1, message.user_id
  end

end
