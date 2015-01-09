FactoryGirl.define do

  factory :customer do
    sequence(:name) { |n| "customer #{n}" }
  end

end