require 'rails_helper'

describe Tag do
  before :each do
    @post = FactoryGirl.create(:post)
    @tag = @post.tags.take
  end

  subject { @tag }

  it { is_expected.to have_many(:posts).through(:taggings) }

  it { is_expected.to validate_uniqueness_of(:name) }
end
