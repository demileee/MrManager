require 'test_helper'

class EventBroadcastJobTest < ActiveJob::TestCase
  test "Event is created after joining a project" do
    project = build(:project)
    project.save
    event = Event.where("project_id = ?", project.id)
    assert_equal "Sally Lee has joined the project.", event.first.message
  end
end
