require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class Project < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :tasks
  has_many :messages

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


  def time_remaining
      time_ago_in_words(self.hard_deadline)
  end

  def percentage_complete
    completed = self.tasks.select do |task|
      task.complete?
    end
    ( completed.length / self.tasks.length ) * 100
  end

  def assign_mr_manager_to_project
    Member.create(user: self.user, project: self, role: "Mr. Manager")
  end

end
