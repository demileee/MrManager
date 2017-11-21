require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create user" do
    user = build(:user)
    user.save
    assert user.valid?
  end

  test "create invalid user" do
    user = build(:user, first_name: nil)
    user.save
    refute user.valid?
  end
end
