require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test "Can create task" do
    task = build(:task)
    task.save
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

  test "task hasn't been completed" do
    task = build(:task)
    refute task.complete?
  end

  test "task can be completed" do
    task = build(:task)
    task.completed
    assert_equal Date.today, task.completed_on
  end

  test "check that task has been completed" do
    task = build(:task)
    task.completed
    assert task.complete?
  end

  test "cannot complete a task more than once" do
    task = build(:task, completed_on: (Date.today - 1.month))
    task.completed
    assert_equal (Date.today - 1.month), task.completed_on
  end

  test "task can be created with message" do
    message = build(:message)
    task = build(:task, message: message)
    assert_equal task.message, message
  end

  test "pinned task is removed from user on completion" do
    task = build(:task)
    user = task.user
    user.task = task
    user.save
    task.completed
    task.save
    refute user.task
  end

  test "that a task was assigned by owner" do
    project = build(:project)
    task = build(:task, project: project, user: project.user)
    assert task.is_project_owner?
  end

  test "That a task was not assigned by the owner" do
    project = build(:project)
    user1 = project.user
    user2 = build(:user)
    task = build(:task, project: project, user: user2)
    refute task.is_project_owner?
  end

end
