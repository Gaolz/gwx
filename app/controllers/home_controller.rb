# home controller
class HomeController < ApplicationController
  def about
  end

  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(5)
  end
end
