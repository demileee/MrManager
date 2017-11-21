FactoryBot.define do
  factory :project do
    title "Save the Kittens"
    user
    description "A project to help the kittens"
    hard_deadline Date.today + 1.month
  end
end
