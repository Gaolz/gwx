# encoding : utf-8
require 'rails_helper'

describe Post, type: :model do
  before :each do
    @post = create(:post)
  end

  subject { @post }

  it { is_expected.to have_many(:tags).through(:taggings) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:url_title) }
  it { is_expected.to validate_presence_of(:content) }

  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to validate_uniqueness_of(:url_title) }
end
