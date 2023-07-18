class LanguagesController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to :user_session
      return
    end
    @user= current_user
    @languages= @user.languages
    @language = Language.new
    @group = Group.new
    @word = Word.new
  end

  def show
    @language= Language.find(params[:id])
  end

  def destroy
    @language = Language.find(params[:id])
    @language.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to :root, notice: 'Language was successfully destroyed.' }
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