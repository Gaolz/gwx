# encoding : utf-8
require 'rails_helper'

describe Post, type: :model do

  it { is_expected.to have_many(:tags).through(:taggings) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:url_title) }
  it { is_expected.to validate_presence_of(:content) }

  it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
  it { is_expected.to validate_uniqueness_of(:url_title) }

  describe "instance methods" do
    let(:post) { create(:post) }

    describe "to_param" do
      it "return url_title" do
        expect(post.to_param).to eq post.url_title
      end
    end

    describe "all_tags" do
      before { 2.times { create(:tag) } }
      it "returns all tags with a string joined by ', '" do
        post.tags = Tag.all
        expect(post.all_tags).to eq Tag.all.map(&:name).join(', ')
      end
    end
  end
end
