FactoryGirl.define do
  factory :read do
    sequence :url do |n|
      "http://#{n}example.com"
    end
  end
end
