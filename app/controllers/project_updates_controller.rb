class ProjectUpdatesController < ApplicationController
  before_action :require_login, except: [:show]

  def new
    @update = ProjectUpdate.new
    @project = Project.find(params[:project_id])
  end

  def show
  end

  def edit
    @update = ProjectUpdate.new
    @project = Project.find(params[:project_id])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
