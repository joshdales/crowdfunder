class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.cover_pic = params[:user][:cover_pic]
    @user.user_pic = params[:user][:user_pic]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      auto_login(@user)
      redirect_to projects_url
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @backed_projects = current_user.pledged_projects.uniq
  end

  def owner
    @owner = Project.find(params[:project_id]).user
    @backed_projects = @owner.pledged_projects.uniq
  end
end
