FactoryGirl.define do

  sequence(:email) { |n| "user#{n}@example.com"}
  sequence(:first_name) { |n| "Sample#{n}" }
  sequence(:last_name) { |n| "User#{n}" }

  factory :user, aliases: [:commenter] do
    first_name
    last_name
    email
    password "Password1"
    password_confirmation "Password1"
    admin false
  end

  factory :admin, class: User do
    first_name "Admin"
    last_name "User"
    email
    password "Password2"
    password_confirmation "Password2"
    admin true
  end

end