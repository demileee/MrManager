class Member < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :project, :user, presence: true

  def invite_accepted?
    return true if self.invite_accepted
  end

  def join_project
    invite_accepted = true
  end

end
