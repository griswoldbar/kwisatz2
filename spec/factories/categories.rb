FactoryGirl.define do
  factory :category do |f|
    sequence(:name) { |n| "Category #{n}" }
  end
end