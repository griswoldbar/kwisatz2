FactoryGirl.define do
  factory :player do |f|
    sequence(:name) { |n| "Player #{n}" }
    f.association :user
  end
end