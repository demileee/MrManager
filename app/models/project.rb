class Project < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :tasks
  has_many :messages

  validates :title, :user, :description, :hard_deadline, presence: true

  validates :title, length: { maximum: 150 }

  validate :project_deadline_valid

  def project_deadline_valid
    errors.add(:hard_deadline, "has to be in the future") if hard_deadline.present? && hard_deadline < Date.today
  end

end
