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
    Message.create(user: self.user, project: self.project, message_body: "Hi everyone, I've joined #{self.project.title}")
  end

  def project_tasks_total(project)
    tasks = self.user.tasks.where("project_id = ?", project.id)
    high = tasks.where("priority = ?", 3).count.to_f
    med = tasks.where("priority = ?", 2).count.to_f
    low = tasks.where("priority = ?", 1).count.to_f
    total = (high*3) + (med*2) + (low*1)
    return total
  end

  def project_tasks_completed(project)
    self.user.tasks.where("project_id = ?", project.id).where.not(completed_on: nil).count.to_f
  end

  def project_tasks_completed_percent(project)
    ratio = (self.project_tasks_completed(project) / self.project_tasks_total(project)).round(2)
    if self.user.tasks.where("project_id = ?", project.id).count > 0
      return "#{(ratio*100).floor}"
    else
      return ""
    end
  end

  private

  def create_notification_for_new_member(member)
    if member.project.user != member
      n = Notification.create message: "You've been invited to a new project: #{member.project.title}", user_id: member.user_id
      Slack.new.post_message(member.user, n)
    end
  end

  def create_event_and_notification_for_member_accepted(member)
    Event.create message: "#{member.user.full_name} has joined the project.", project_id: member.project_id
    n = Notification.create message: "#{member.user.full_name} has joined #{member.project.title}", user_id: member.project.user_id
    Slack.new.post_message(member.user, n)
  end

end
