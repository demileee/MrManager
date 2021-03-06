require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "user can create project" do
    project = build(:project)
    project.save
    assert project.valid?
  end

  test "project must have a title" do
    project = build(:project, title: nil)
    project.save
    refute project.valid?
  end

  test "project must have a user" do
    project = build(:project, user: nil)
    project.save
    refute project.valid?
  end

  test "project must have a hard_deadline" do
    project = build(:project, hard_deadline: nil)
    project.save
    refute project.valid?
  end

  test "project must have a description" do
    project = build(:project, description: nil)
    project.save
    refute project.valid?
  end

  test "project title must be less than 150 chars" do
    project = build(:project, title: "fjdakshfdjfhdjsakhfjkahfjkahfjkdashjfkhajksfhdjkahfkjaskalshfdjkalshfkasfhjkadsfhjkashfjkadhfjkashfjkdashfjkadshjfkdashfjklashflashfkljashfjklashfklashfadkjls")
    project.save
    refute project.valid?
  end

  test "user can edit project's hard_deadline" do
    project = build(:project)
    date = Date.today + 1.day
    project.hard_deadline = date
    project.save
    assert_equal project.hard_deadline, date
  end

  test "user can edit project's title" do
    project = build(:project)
    project.title = "Save trees"
    project.save
    assert_equal project.title, "Save trees"
  end

  test "user can edit project's description" do
    project = build(:project)
    project.description = "This project is great"
    project.save
    assert_equal project.description, "This project is great"
  end

  test "project deadline cannot be in the past" do
    project = build(:project)
    date = Date.today - 1.day
    project.hard_deadline = date
    project.save
    refute project.valid?
  end

  test "user can add soft_deadline" do
    project = build(:project, soft_deadline: Date.today)
    project.save
    assert project.valid?
  end

  test "user can edit soft_deadline" do
    project = build(:project, soft_deadline: Date.today)
    date = Date.today + 1.day
    project.soft_deadline = date
    project.save
    assert_equal project.soft_deadline, date
  end

  test "user is told if there are no tasks" do
    project = build(:project)
    project.save
    assert_equal "There are currently no tasks", project.percentage_complete
  end

  test "can find out the percentage of completed tasks" do
    project = build(:project)
    project.save
    task1 = build(:task, project: project)
    task1.completed
    task1.save
    task2 = build(:task, project: project)
    task2.save
    assert_equal "50%", project.percentage_complete
  end

  test "member is created after a project" do
    project = build(:project)
    project.save
    assert project.members.present?
  end

  test "user is assigned as a member when a project is created" do
    project = build(:project)
    project.save
    members = project.members.map { |m| m.user }
    assert_includes members, project.user
  end

  test "can remove soft deadline" do
    project = build(:project, soft_deadline: Date.today)
    project.remove_soft_deadline
    refute project.soft_deadline
  end

  test "display time till hard deadline" do
    project = build(:project, hard_deadline: 1.week.from_now)
    if Time.now < Time.now.middle_of_day && Time.now > Time.now.yesterday.midnight
      time = "7 days"
    else
      time = "6 days"
    end
    assert_equal time, project.time_remaining_hard_dd
  end

  test "display time till soft deadline" do
    project = build(:project, soft_deadline: 1.week.from_now)
    if Time.now < Time.now.middle_of_day && Time.now > Time.now.yesterday.midnight
      time = "7 days"
    else
      time = "6 days"
    end
    assert_equal time, project.time_remaining_soft_dd
  end
end
