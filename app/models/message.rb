class Message < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :project, :user, :message_body, presence: true
end
