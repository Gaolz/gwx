require 'faker'

FactoryGirl.define do
    factory :tag, class: "Tag" do
        sequence(:name) { |n| "#{Faker::Name.name}#{n}" }
    end
end