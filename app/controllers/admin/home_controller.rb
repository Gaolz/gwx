module Admin
  # admin home page
  class HomeController < AdminController
    
    def index
      @post_count = Post.count
      @visited_count = Post.sum(:visited_count)
    end
  end
end
