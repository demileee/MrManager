class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :project, :user, :task_body, :priority, presence: true
  validates :task_body, length: { maximum: 400 }
  validates :priority, numericality: { less_than_or_equal_to: 3, greater_than: 0, only_integer: true }
end
