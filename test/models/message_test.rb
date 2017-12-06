require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test "user can create message" do
    message = build(:message)
    assert message.valid?
  end

  test "cannot post if not a member" do
    message = build(:message, user:nil)
    refute message.valid?
  end

  test "message does not save without a body" do
    message = build(:message, message_body: nil)
    refute message.valid?
  end

  test "message can be an annoucement" do
    message = build(:message, announcement: true)
    assert_equal true, message.announcement?
  end

  test "message cannot be created without a project" do
    message = build(:message, project: nil)
    refute message.valid?
  end

  test "only project owner can assign announcement" do
    user = build(:user)
    message = build(:message, user: user, announcement: true)
    refute message.valid?
  end

end
