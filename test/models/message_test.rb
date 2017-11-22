require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "user can create message" do
    user = users(:dave)
    message = Message.new(message_body: "Did you call the shelter?")
    message.user_id = user.id
    assert_equal 1, message.user_id
  end

  test "cannot post if not a member" do
    message = build(:message)
    message.user_id = nil
    refute message.valid?
  end

  test "message does not save without a body" do
    message = build(:message)
    message.message_body = nil
    refute message.valid?
  end
  # test "only project owner can assign announcement" do
  #   project = build(:project)
  #   user = project.user
  #   user_two = build(:user)
  #   user_two.save
  #   message = build(:message, user_id: user)
  #   message.announcement =
  # end
  # project, , :message_body, presence: true
end
