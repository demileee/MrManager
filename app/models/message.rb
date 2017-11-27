class Message < ApplicationRecord
  after_save { |message| create_event(message) if message.announcement }

  belongs_to :project
  belongs_to :user

  validates :project, :user, :message_body, presence: true

  private

  def create_event(message)
    Event.create message: "A new announcement has been created: #{message.message_body}", project_id: message.project_id
  end
end
