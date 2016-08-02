# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  title         :string(30)       default("我的日志"), not null
#  content       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  url_title     :string
#  visited_count :integer          default(0), not null
#
# Indexes
#
#  index_posts_on_url_title  (url_title)
#

require 'rails_helper'

describe PostsController, type: :controller do
  render_views
  let(:post) { create :post }

  describe "Get #index" do
    before { get :index }

    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template("index") }
  end

  describe "Get #show" do
    before { get :show, id: post.url_title }

    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template("show") }
  end
end
