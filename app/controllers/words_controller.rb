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
end
