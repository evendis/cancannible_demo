FactoryGirl.define do

  factory :user do
    sequence(:username) { |n| "username_#{n}" }
    password '123456789'
    password_confirmation '123456789'

    trait :with_group do
      group
    end
  end

end