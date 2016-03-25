class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
  end
end
