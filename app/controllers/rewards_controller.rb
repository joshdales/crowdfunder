class RewardsController < ApplicationController
  before_action :load_project
  before_action :load_new_reward, only: %i(new create)
  before_action :ensure_login
  before_action :ensure_ownership, only: %i(new create)

  def new

  end

  def create
    @reward.dollar_amount = params[:reward][:dollar_amount]
    @reward.description = params[:reward][:description]
    @reward.limit = params[:reward][:limit]
    if @reward.save
      redirect_to project_url(@project), notice: 'Reward created'
    else
      render :new
    end
  end

  def update
    @reward = Reward.find(params[:id])
    @reward.increment(:claimed)
    if @reward.save
      flash[:alert] = "1 #{ @reward.description } has been claimed!"
    else
      flash[:alert] = "You are not eligible to claim this reward!"
    end
    redirect_to project_url(@project)
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

  def load_new_reward
    @reward = @project.rewards.build
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
