class Slack

  def initialize
  end

  def post_message(user, notification)
    if user.slack_id.present?
      hash = {
        token: user.token,
        channel: user.slack_id,
        text: notification.message
        }
      url = "https://slack.com/api/chat.postMessage"
      response = HTTParty.post(url, body: hash)
    end
  end
end
