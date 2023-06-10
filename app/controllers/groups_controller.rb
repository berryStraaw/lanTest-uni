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
      @group.save
        #redirect_to language_groups_path(language_id: group_params[:language_id])
        #index(group_params[:language_id])
        #render turbo_stream: turbo_stream.replace('groupsTest', partial: 'partials/groups', locals: { group: @group })
        #redirect_to :root, notice: "Group was successfully created."
        #redirect_to @group
      #redirect_to language_groups_path(language_id: group_params[:language_id])
      format.turbo_stream
      format.html { redirect_to @group }
    end
  
    private
  
    def group_params
      params.require(:group).permit(:name, :language_id) # Add any other group parameters
    end
end
