# frozen_string_literal: true

class GroupsController < ApplicationController
  def index
    @language = Language.find(params[:language_id])
    @groups = @language.groups
    @group = Group.new
    # Rails.logger.info "----------------------------------------------GROUPS VIEW CONTROLLER----------------------------"
    # Rails.logger.info @groups.inspect
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def destroy
    @language = Language.find(params[:language_id])
    @group = @language.groups.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to language_groups_path(@language), notice: 'Group was successfully destroyed.' }
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
        format.html { redirect_to language_groups_path(@group.language), notice: 'Group was successfully created.' }
      else
        format.html { render :index }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('new_group', partial: 'groups/group', locals: { group: @group })
        end
      end
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_update_params)
      render json: { name: @group.name }
    else
      render json: { error: 'Could not save changes' }, status: :unprocessable_entity
    end
  end

  private

  def group_update_params
    params.require(:group).permit(:name) # Add any other group parameters
  end

  def group_params
    params.require(:group).permit(:name, :language_id) # Add any other group parameters
  end
end
