class Member < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :project, :user, presence: true

end
