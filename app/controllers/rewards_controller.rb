class RewardsController < ApplicationController
  before_action :load_project
  before_action :ensure_login

  def new
    @reward = Reward.new
  end

  def create
    @reward = @project.rewards.build
    @reward.dollar_amount = params[:reward][:dollar_amount]
    @reward.description = params[:reward][:description]

    if @reward.save
      redirect_to project_url(@project), notice: 'Reward created'
    else
      render :new
    end
  end

  def destroy
    @reward = Reward.find(params[:id])
    if ensure_ownership
    else
      @reward.destroy
      redirect_to project_url(@project), notice: 'Reward successfully removed'
    end
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

  def ensure_login
    if !current_user
      flash[:alert] = ["You must be logged in."]
      redirect_to project_url(@project)
    end
  end

  def ensure_ownership
    if current_user != @reward.project.user
      flash[:alert] = "You must be the project's owner."
      redirect_to project_url(@project)
    end
  end
end
