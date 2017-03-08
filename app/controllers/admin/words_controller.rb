module Admin
  # admin manages words
  class WordsController < AdminController

    def create
      @word = Word.new(word_params)
      if @word.save
        redirect_back fallback_location: admin_words_path, flash: { success: 'create word successful' }
      else
        redirect_back fallback_location: admin_words_path, flash: { error: 'something wrong' }
      end
    end

    def index
      @word = Word.new
      @words = Word.order('ID DESC').page(params[:page]).per(5)
      respond_to :html, :js
    end

    private

    def word_params
      params.require(:word).permit(:body)
    end
  end
end
