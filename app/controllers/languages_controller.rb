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
    @language = Language.find(params[:id])
    @groups = @language.groups
  
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
