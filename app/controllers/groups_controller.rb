class GroupsController < ApplicationController
  def index
      @language = Language.find(params[:language_id])
      @groups = @language.groups
      @group = Group.new
      Rails.logger.info "----------------------------------------------GROUPS VIEW CONTROLLER----------------------------"
      Rails.logger.info @groups.inspect
      respond_to do |format|
        format.turbo_stream
        format.html
      end
  end

  def new
      @group = Group.new
    end

    def create
      @group = Group.new(group_params)
      if @group.save
        render turbo_stream: turbo_stream.replace('groups', partial: 'partials/groups', locals: { group: @group })
        #redirect_to :root, notice: "Group was successfully created."
      else
        render :new
      end
    end
  
    private
  
    def group_params
      params.require(:group).permit(:name, :language_id) # Add any other group parameters
    end
end
