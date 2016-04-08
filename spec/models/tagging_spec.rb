require 'rails_helper'

describe Tagging, type: :model do
  before :each do
    @post = FactoryGirl.create(:post)
    @tagging = @post.taggings.take
  end

  subject { @tagging }

  it { is_expected.to belong_to(:tag) }
  it { is_expected.to belong_to(:post) }

  describe "Class Methods" do
    context "#post_count(tag_name)" do
      before :each do
        create_list(:ruby_post, 4)
      end

      it "when exist the posts" do
        expect(Tagging.post_count("ruby")).to eq 4
      end

      it "when absence of posts" do
        expect(Tagging.post_count("js")).to eq 0
      end
    end
  end
end
