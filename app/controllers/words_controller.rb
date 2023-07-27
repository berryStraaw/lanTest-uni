# frozen_string_literal: true

class WordsController < ApplicationController
  def index
    @word = Word.new
    @test = Test.new
    # Rails.logger.info "----------------------------------------------WORDS VIEW CONTROLLER----------------------------"
    # Rails.logger.info params
    # Rails.logger.info "----------------------------------------------WORDS VIEW CONTROLLER----------------------------"

    if params[:language_id]
      # @language= @group.language
      @language = Language.find(params[:language_id])
      @groups = @language.groups
      @words = []
      @groups.each do |group|
        @words += group.words
      end
      @user = @language.user
    else
      @group = Group.find(params[:group_id])
      @words = @group.words
      @user = @group.language.user
    end

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @word = @group.words.find(params[:id])
    @word.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to group_words_path(@group), notice: 'Word was successfully destroyed.' }
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
        format.html { redirect_to group_words_path(@word.group), notice: 'Word was successfully created.' }
      else
        format.html { render :index }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('new_group', partial: 'groups/group', locals: { group: @group })
        end
      end
    end
  end

  private

  def word_params
    params.require(:word).permit(:name, :group_id, :meaning)
  end
end
