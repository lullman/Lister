FactoryGirl.define do
  factory :list do
    association :user

    list_name Faker::Book.genre
    
  end
end
