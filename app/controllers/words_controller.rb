class WordsController < ApplicationController
    def index
        @group = Group.find(params[:group_id])
        @words = @group.words

        Rails.logger.info "----------------------------------------------WORDS VIEW CONTROLLER----------------------------"
        Rails.logger.info @words.inspect
        respond_to do |format|
          format.turbo_stream
          format.html
        end
    end

    def new
        @word = Word.new
      end

      def create
        @word = Word.new(word_params)
        if @word.save
          redirect_to :root, notice: "Word was successfully created."
        else
          render :new
        end
      end
    
      private
    
      def word_params
        params.require(:word).permit(:name, :group_id, :meaning)
      end
end
