FactoryGirl.define do
    sequence(:email) { |n| "user#{n}@example.com" }
  factory :user do
    email
    password
end
   factory :admin, class: User do
  email
  password 
  end
end