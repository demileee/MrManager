class Message < ApplicationRecord
  after_save do |message|
    create_event(message) if message.announcement
    create_notification(message) if message.announcement
  end

  belongs_to :project
  belongs_to :user

  validates :project, :user, :message_body, presence: true
  validate :announcement_made_by_owner

  def announcement_made_by_owner
    if self.announcement == true && self.user != self.project.user
      errors.add(:announcement, "has to be made by the owner")
    end
  end

  private

  def create_event(message)
    Event.create message: "Announcement: #{message.message_body}", project_id: message.project_id
  end

  def create_notification(message)
    n = Notification.create message: "Announcement for #{message.project.title}: #{message.message_body}", user_id: message.user_id

    Slack.new.post_message(message.user, n)
  end
end
