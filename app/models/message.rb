class Message < ApplicationRecord
  after_save do |message|
    create_event(message) if message.announcement
    create_notification(message) if message.announcement
  end

  belongs_to :project
  belongs_to :user

  validates :project, :user, :message_body, presence: true

  private

  def create_event(message)
    Event.create message: "A new announcement has been created: #{message.message_body}", project_id: message.project_id
  end

  def create_notification(message)
    Notification.create message: "#{message.project.title}: #{message.message_body}", user_id: message.user_id
  end
end
