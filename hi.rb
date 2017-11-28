require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['MR_MANAGER_ID']
  raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

client = Slack::Web::Client.new

client.auth_test

client.chat_postMessage(channel: '#general', text: 'Hello World', as_user: true)
