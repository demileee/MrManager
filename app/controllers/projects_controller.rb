class ProjectsController < ApplicationController
  def index
    @owned_projects = current_user.projects
    @projects = Member.where('user_id = ?', "#{current_user.id}")
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])

  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      flash.now[:notice] = "#{@project.title} has been successfully created!"
      redirect_to projects_url
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :soft_deadline, :hard_deadline)
  end
end
