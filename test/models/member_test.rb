require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  test "can create project member" do
    member = build(:member)
    member.save
    assert member.persisted?
  end

  test "cannot create member if project does not exist" do
    member = build(:member, project: nil)
    member.save
    refute member.persisted?
  end

  test "cannot create member if user does not exist" do
    member = build(:member, user: nil)
    member.save
    refute member.persisted?
  end

  test 'role can be assigned to member' do
    member  = build(:member)
    member.role = "Developer"
    member.save
    assert member.persisted?
  end

  test 'member can accept invitation' do
    project = build(:project)
    member = build(:member, project: project)
    member.join_project
    member.save
    assert member.invite_accepted?
  end

  test 'invite_accepted? method returns false when not accepted' do
    project = build(:project)
    member = build(:member, project: project)
    refute member.invite_accepted?
  end

  test 'project_tasks_total method returns total' do
    member = build(:member)
    project = member.project
    task = build(:task, project: project, user: member.user, priority: 2)
    task.save
    task_2 = build(:task, project: project, user: member.user, priority: 1)
    task_2.save
    expected = 3
    assert_equal(expected, member.project_tasks_total(project))
  end
end
