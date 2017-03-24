require 'rails_helper'

describe Tagging, type: :model do

  it { is_expected.to belong_to(:tag) }
  it { is_expected.to belong_to(:post) }

  describe "Class Methods" do
    context "#post_count(tag_name)" do

      before :each do
        tag = create(:tag, name: 'ruby')
        create_list(:ruby_post, 4)
        tag.posts = Post.all
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
