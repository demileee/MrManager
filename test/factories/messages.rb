FactoryBot.define do
  factory :message do
    project
    user
    message_body "Hey I called the shelter"
  end
end
