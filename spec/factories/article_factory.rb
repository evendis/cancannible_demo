FactoryGirl.define do

  factory :article do
    sequence(:title) { |n| "title #{n}" }
  end

end