require 'test_helper'

class EventBroadcastJobTest < ActiveJob::TestCase
  test "Event is created after joining a project" do
    project = build(:project)
    project.save
    events = Event.where("project_id = ?", project.id)
    assert_equal "Sally Lee has joined the project.", events.first.message
    message = build(:message, user: project.user, project:project, announcement: true)
    message.save
    assert_equal "Announcement: Hey I called the shelter", events.last.message
  end
end
