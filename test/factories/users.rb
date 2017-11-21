FactoryBot.define do
  factory :user do
    first_name "Sally"
    last_name "Lee"
    profile_pic "robohash.org/sally?set=set4"
    sequence(:email) { |num| "sally#{num}@bitmaker.co"}
    password "password"
    password_confirmation "password"
  end
end
