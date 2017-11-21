FactoryBot.define do
  factory :user do
    first_name "Sally"
    last_name "Lee"
    profile_pic "robohash.org/#{first_name}?set=set4"
    sequence(:email) { |num|_ "sally#{num}@bitmaker.co"}
    password "password"
    password_confirmation "password"
  end
end
