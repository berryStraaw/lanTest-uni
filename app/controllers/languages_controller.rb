class LanguagesController < ApplicationController
  def index
    @languages= Language.all
    @language = Language.new
    @group = Group.new
    @word = Word.new
  end

  def show
    @language= Language.find(params[:id])
  end

  def groups
    Rails.logger.info "GROUPS"
    Rails.logger.info Group.all.inspect
    @language = Language.find(params[:id])
    Rails.logger.info "LANGUAGE"
    Rails.logger.info @language.inspect
    @groups = @language.groups
    Rails.logger.info "ONEGROUP"
    Rails.logger.info @groups.inspect
  
    respond_to do |format|
      format.turbo_stream { render partial: 'partials/groups', locals: { groups: @groups } }
      format.html { redirect_to languages_path }
    end
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)
    if @language.save
      redirect_to :root, notice: "Language was successfully created."
    else
      render :new
    end
  end

  private

  def language_params
    params.require(:language).permit(:language, :user_id)
  end
end
