FactoryGirl.define do
  factory :photo do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'factories', 'images', 'muller.png')) }
  end
end
