class ProjectUpdatesController < ApplicationController
  before_action :require_login, except: [:show]

  def new
    @update = ProjectUpdate.new
    @project = Project.find(params[:project_id])
  end

  def show
    @update = ProjectUpdate.find(params[:project_update_id])
    @project = Project.find(params[:project_id])
  end

  def edit
    @update = ProjectUpdate.find(params[:project_update_id])
    @project = Project.find(params[:project_id])
  end

  def create
    @update = ProjectUpdate.new
    @project = Project.find(params[:project_id])
    @update.project = @project
    @update.title = params[:project_update][:title]
    @update.description = params[:project_update][:description]

    if @update.save
      redirect_to project_url(@project)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end
end
