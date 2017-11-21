require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create user" do
    user = build(:user)
    user.save
    assert user.valid?
  end

  test "cannont create user without valid first_name" do
    user = build(:user, first_name: nil)
    user.save
    refute user.valid?
  end

  test "can find user.email" do
    user = build(:user, email: "salle@bitmaker.co")
    user.save
    email = User.find_by("email = ?", "salle@bitmaker.co")
    assert_equal email, user
  end

  test "Email must be unique" do
    user1 = build(:user, email: "same@bitmaker.co")
    user2 = build(:user, email: "same@bitmaker.co")
    user1.save
    user2.save
    refute user2.valid?
  end

  test "User must include password_confirmation on create" do
    user = build(:user, password_confirmation: nil)
    user.save
    refute user.valid?
  end

  test "User password must be 8 characters long" do
    user = build(:user, password: "1234", password_confirmation: "1234")
    user.save
    refute user.valid?
  end

  test "User password and password_confirmation must match" do
    user = build(:user, password_confirmation: "23o4uweidign")
    user.save
    refute user.valid?
  end

  test "User can add note" do
    user = build(:user, notes: "Note to self")
    user.save
    note = "Note to self"
    assert_equal note, user.notes
  end

  # test "User can pin existing task" do
  #   task = build(:task)
  #   user = task.user
  #   user.pinned_task_id = task
  #   assert_equal task, user.pinned_task_id
  # end

end
