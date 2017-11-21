require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test "Can create task" do
    task = build(:task)
    assert task.valid?
  end

  test "Cannot create task without project" do
    task = build(:task, project: nil)
    task.save
    refute task.valid?
  end

  test "Cannot create task without user" do
    task = build(:task, user: nil)
    task.save
    refute task.valid?
  end

  test "Cannot create task without task_body" do
    task = build(:task, task_body: nil)
    task.save
    refute task.valid?
  end

  test "Cannot create task without priority" do
    task = build(:task, priority: nil)
    task.save
    refute task.valid?
  end

  test "priority must be greater than 0" do
    task = build(:task, priority: 0)
    task.save
    refute task.valid?
  end

  test "priority must be positive" do
    task = build(:task, priority: -1)
    task.save
    refute task.valid?
  end

  test "priority must be between 1 and 3" do
    task = build(:task, priority: 3)
    task.save
    assert task.valid?
  end

  test "priority cannot be greater than 3" do
    task = build(:task, priority: 4)
    task.save
    refute task.valid?
  end

  test "priority must be a integer" do
    task = build(:task, priority: "a")
    task.save
    refute task.valid?
  end

end
