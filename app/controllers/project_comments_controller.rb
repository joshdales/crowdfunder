class ProjectCommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @project_comment = @project.project_comments.build
    @project_comment.user = current_user
    @project_comment.comment = params[:project_comment][:comment]

    if @project_comment.save
      flash[:notice] = "Thank you for submitting your comment!"
      redirect_to project_url(@project)
    else
      flash[:alert] = "Sorry, there was a problem with submitting your comment!"
      render "projects/show"
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @project_comment = @project.project_comments.find(params[:id])
    @project_comment.destroy
    flash[:notice] = "Your comment has been successfully deleted!"
    redirect_to project_url(@project)
  end
end
