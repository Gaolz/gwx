class Admin::HomeController < AdminController
  before_action :admin_required
  def index
    @post_count = Post.count
    @visited_count = Post.sum(:visited_count)
  end
end
