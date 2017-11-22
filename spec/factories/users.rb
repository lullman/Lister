FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    password "password"
    sequence(:username) { |n| "jdoe#{n}"}

    factory :invalid_user do 
      first_name nil
    end
    
  end
end
