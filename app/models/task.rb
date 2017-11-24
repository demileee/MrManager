class Task < ApplicationRecord
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
  end

  def is_project_owner?
    if self.user_id == self.project.user_id
      self.assigned_by_owner = true
    else
      self.assigned_by_owner = false
    end
  end
end
