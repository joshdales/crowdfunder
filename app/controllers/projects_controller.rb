class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)
    @successful_projects = []
    @projects.each do |project|
      if (project.pledges.map{|p|p.dollar_amount}.sum) >= project.goal
        @successful_projects << project
      end
    end
  end

  def show
    @project = Project.find(params[:id])
    @rewards = @project.rewards.sort_by { |r| r.dollar_amount}
    @pledge = Pledge.new
    @updates = @project.project_updates.where("created_at < ?", @project.end_date)
    @pledger_updates = @project.project_updates.where("created_at > ?", @project.end_date).reverse
    @comment = ProjectComment.new
  end

  def new
    @project = Project.new
    @project.rewards.build
    @tags = Tag.all
  end

  def create
    @project = Project.new
    @tags = Tag.all
    @project.title = params[:project][:title]
    @project.description = params[:project][:description]
    @project.goal = params[:project][:goal]

    @project.start_date = DateTime.new(
      params[:project]["start_date(1i)"].to_i,
      params[:project]["start_date(2i)"].to_i,
      params[:project]["start_date(3i)"].to_i,
      params[:project]["start_date(4i)"].to_i,
      params[:project]["start_date(5i)"].to_i
    )

    @project.end_date = DateTime.new(
      params[:project]["end_date(1i)"].to_i,
      params[:project]["end_date(2i)"].to_i,
      params[:project]["end_date(3i)"].to_i,
      params[:project]["end_date(4i)"].to_i,
      params[:project]["end_date(5i)"].to_i
    )
    @project.image = params[:project][:image]
    @project.user = current_user
    @project.tag_ids = params[:project][:tag_ids]

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def search
    @projects = []
    if Project.search(params[:search])
      @search_projects = Project.search(params[:search]).to_a
    else
      @search_projects = []
    end
    @projects << @search_projects
    if Tag.search(params[:search])
      @search_tags = Tag.search(params[:search]).projects.all.to_a
    else
      @search_tags = []
    end
    @projects  << @search_tags
    @projects.flatten!
    @projects.uniq
  end

end
