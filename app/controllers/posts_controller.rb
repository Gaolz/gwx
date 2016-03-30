class PostsController < ApplicationController
  def index
    if params[:tag]
      @posts_count = Tagging.post_count(params[:tag])
      @posts = Post.tagged_with(params[:tag]).page(params[:page]).per(5)
    else
      @posts = Post.order(id: :desc).page(params[:page]).per(5)
    end
  end

  def show
    @post = Post.find_by_url_title!(params[:id])
    @post.visited_count += 1
    @post.save
    @prev = Post.where('created_at > ?', @post.created_at).first
    @next = Post.where('created_at < ?', @post.created_at).last
  end
end
