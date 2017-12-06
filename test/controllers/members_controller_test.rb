require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "percentage of a members completed tasks with no tasks" do
    member = build(:member)
    assert_equal "", member.project_tasks_completed_percent(member.project)
  end

  test "percentage of a members completed tasks" do
    member = build(:member)
    member.save
    task = build(:task, project: member.project, user: member.user)
    task.completed
    task.save
    assert_equal "50", member.project_tasks_completed_percent(member.project)
  end
end
