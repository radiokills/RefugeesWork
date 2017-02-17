FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "SecredPassword123"
    wallet 0
    bio "Quick Bio"
    skills "Skills"
    name "User Name"
    accepted_terms_of_use true
    city "City"
    languages "List, of, languages"
    subscribed_to_notifications true
    user_type "user"
  end
end
