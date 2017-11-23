class Member < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :project, :user, presence: true
  validate :project_exists?
  validate :user_exists?

  def project_exists?
    if !Project.exists?(project.id)
      errors.add(:member, "You can not add a member to a project that does not exist.")
    end
  end

  def user_exists?
    if !User.exists?(user.id)
      errors.add(:member, "You can not add a member who is not a current user.")
    end
  end
end
