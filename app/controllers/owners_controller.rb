class OwnersController < ApplicationController

  def show
    @owner = Project.find(params[:project_id]).user
    @backed_projects = @owner.pledged_projects.uniq
  end

end
