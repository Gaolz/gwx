require 'faker'

FactoryGirl.define do
  factory :post, class: "Post" do
    title Faker::Name.title.truncate(25)
    url_title { Pinyin.t(title.dup, splitter: '-') }
    content Faker::Lorem.paragraphs
    all_tags Faker::Hipster.words.join(',')

    factory :invalid_post do
      title nil
    end

    factory :ruby_post do
      sequence(:title) { |n| "iloveruby_#{n}" }
      all_tags "ruby,rails"
    end
  end
end
