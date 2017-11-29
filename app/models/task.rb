class Task < ApplicationRecord
  after_save do |task|
    create_event_and_notification_for_new_task(task) if !task.complete?
    create_event_and_notification_for_completed_task(task) if task.complete?
  end

  belongs_to :project
  belongs_to :user
  has_many   :pinned_user, through: :users, source: :task
  has_one    :message

  validates :project, :user, :task_body, :priority, presence: true
  validates :task_body, length: { maximum: 400 }
  validates :priority, numericality: { less_than_or_equal_to: 3, greater_than: 0, only_integer: true }


  def complete?
    return true if self.completed_on.present?
  end

  def completed
    self.completed_on = Date.today unless complete?
    self.user.remove_pinned_task
  end

  def is_project_owner?
    if self.user_id == self.project.user_id
      self.assigned_by_owner = true
    else
      self.assigned_by_owner = false
    end
  end

  private

  def create_event_and_notification_for_new_task(task)
    Event.create message: "A new task has been created: #{task.task_body}", project_id: task.project_id

    n = Notification.create message: "You've been assigned to a new task: #{task.task_body}", user_id: task.user_id

    Slack.new.post_message(task.user, n)

  end

  def create_event_and_notification_for_completed_task(task)
    Event.create message: "Task completed: #{task.task_body}", project_id: task.project_id

    n = Notification.create message: "Task completed: #{task.task_body}", user_id: task.project.user_id

    Slack.new.post_message(task.user, n)
  end
end
