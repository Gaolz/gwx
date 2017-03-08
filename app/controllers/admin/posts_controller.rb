module Admin
  class PostsController < AdminController

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to admin_posts_path, notice: I18n.t('post.flash.create_success')
      else
        flash.now[:alert] = I18n.t('post.flash.blank_title_or_content')
        render :new
      end
    end

    def edit
      @post = Post.find_by_url_title!(params[:id])
    end

    def update
      @post ||= Post.find_by_url_title!(params[:id])
      if @post.update(post_params)
        redirect_to admin_posts_path, notice: t('post.flash.update_success')
      else
        flash.now[:alert] = t('post.flash.blank_title_or_content')
        render :edit
      end
    end

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
      post_created_at = @post.created_at
      @prev = Post.where('created_at > ?', post_created_at).first
      @next = Post.where('created_at < ?', post_created_at).last
    end

    private

    def post_params
      params.require(:post).permit(:title, :url_title, :content, :all_tags)
    end
  end
end
