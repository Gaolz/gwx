require 'faker'

FactoryGirl.define do
  factory :post do
    title Faker::Name.title.truncate(25)
    url_title { Pinyin.t(title, splitter: '-') }
    content Faker::Lorem.paragraphs
    all_tags Faker::Hipster.words.join(',')

    factory :invalid_post do
      title nil
    end
  end
end
