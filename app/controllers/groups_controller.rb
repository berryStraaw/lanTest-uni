class GroupsController < ApplicationController
  def index()
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
      respond_to do |format|
        if @group.save
          format.turbo_stream
          format.html { redirect_to language_groups_path(@group.language), notice: "Group was successfully created." }
        else
          format.html { render :index }
          format.turbo_stream { render turbo_stream: turbo_stream.replace('new_group', partial: 'groups/group', locals: { group: @group }) }
        end
      end
    end
  
    private
  
    def group_params
      params.require(:group).permit(:name, :language_id) # Add any other group parameters
    end
end
