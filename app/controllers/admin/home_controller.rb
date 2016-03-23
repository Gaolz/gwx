class Admin::HomeController < AdminController
  before_action :admin_required
  def index
    @post_count = Post.count
    @posts = Post.all
  end
end
