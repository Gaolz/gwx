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
