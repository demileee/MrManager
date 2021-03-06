require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class Project < ApplicationRecord
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :title, :user, :description, :hard_deadline, presence: true
  validates :title, length: { maximum: 150 }
  validate :project_deadline_valid
  after_create :assign_mr_manager_to_project

  def project_deadline_valid
    errors.add(:hard_deadline, "has to be in the future") if hard_deadline.present? && hard_deadline < Date.today
  end

  def remove_soft_deadline
    self.soft_deadline = nil
  end

  def time_remaining_hard_dd
    time_ago_in_words(self.hard_deadline)
  end

  def time_remaining_soft_dd
    time_ago_in_words(self.soft_deadline) if self.soft_deadline.present?
  end

  def percentage_complete
    if self.tasks.present?
      completed = self.tasks.select { |task| task.complete? }
      "#{((completed.count.to_f / self.tasks.count.to_f).round(2) * 100).to_i}%"
    else
      "There are currently no tasks"
    end
  end

  def assign_mr_manager_to_project
    Member.create(user: self.user, project: self, role: "Mr. Manager", invite_accepted: true)
    Message.create(user: self.user, project: self, message_body: "Welcome to #{self.title}!")
  end

end
