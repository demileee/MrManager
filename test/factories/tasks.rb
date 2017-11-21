FactoryBot.define do
  factory :task do
    task_body "Check shelter"
    priority 2
    project
    user
    assigned_by_owner true
  end
end
