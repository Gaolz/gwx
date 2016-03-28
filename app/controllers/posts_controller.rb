class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
    @prev = Post.where('created_at > ?', @post.created_at).first
    @next = Post.where('created_at < ?', @post.created_at).last
  end
end
