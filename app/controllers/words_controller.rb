class WordsController < ApplicationController
    def index
        @group = Group.find(params[:group_id])
        @words = @group.words
        @word= Word.new
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
        respond_to do |format|
          if @word.save
            format.turbo_stream
            format.html { redirect_to group_words_path(@word.group), notice: "Word was successfully created." }
          else
            format.html { render :index }
            format.turbo_stream { render turbo_stream: turbo_stream.replace('new_group', partial: 'groups/group', locals: { group: @group }) }
          end
        end
      end
    
      private
    
      def word_params
        params.require(:word).permit(:name, :group_id, :meaning)
      end
end
