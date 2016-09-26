# posts controller
class PostsController < ApplicationController
  def index
    tag = params[:tag]
    page = params[:page]
    if tag
      @posts_count = Tagging.post_count(tag)
      @posts = Post.tagged_with(tag).page(page).per(5)
    else
      @posts = Post.order(id: :desc).page(page).per(5)
    end
  end

  def show
    @post = Post.find_by_url_title!(params[:id])
    @post.increment!(:visited_count)
    post_created_at = @post.created_at
    @prev = Post.where('created_at > ?', post_created_at).first
    @next = Post.where('created_at < ?', post_created_at).last
  end
end
