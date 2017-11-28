class Member < ApplicationRecord
  after_save do |member|
    create_notification_for_new_member(member) if !member.invite_accepted
    create_event_and_notification_for_member_accepted(member) if member.invite_accepted
  end

  belongs_to :project
  belongs_to :user

  validates :project, :user, presence: true

  def invite_accepted?
    return true if self.invite_accepted
  end

  def join_project
    self.invite_accepted = true
  end

  private

  def create_notification_for_new_member(member)
    n = Notification.create message: "You've been invited to a new project: #{member.project.title}", user_id: member.user_id
    Slack.new.post_message(member.user, n)
  end

  def create_event_and_notification_for_member_accepted(member)
    Event.create message: "#{member.user.full_name} has joined the project.", project_id: member.project_id
    n = Notification.create message: "#{member.user.full_name} has joined #{member.project.title}", user_id: member.project.user_id
    Slack.new.post_message(member.user, n)
  end

end
