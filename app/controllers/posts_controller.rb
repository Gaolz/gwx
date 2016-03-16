class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: I18n.t('post.flash.create_success')
    else
      flash.now[:alert] = I18n.t('post.flash.blank_title_or_content')
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: t('post.flash.update_success')
    else
      flash.now[:alert] = t('post.flash.blank_title_or_content')
      render :edit
    end
  end

  def index
    @posts = Post.order(id: :desc).limit(20)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    redirect_to posts_path, notice: t('post.flash.destroy_success') if @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
