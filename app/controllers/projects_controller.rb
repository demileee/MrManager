class ProjectsController < ApplicationController
  before_action :load_project, only: %i(show edit update destroy)
  before_action :ensure_ownership, only: %i(edit update destroy)

  def index
    @projects = Member.where('user_id = ?', "#{current_user.id}")

  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @message = Message.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      flash[:notice] = "#{@project.title} has been successfully created!"
      redirect_to projects_url
    else
      render :new
    end
  end

  def edit

  end

  def update
    @project.update(project_params)

    if @project.save
      flash[:notice] = "#{@project.title} has been successfully updated!"
      redirect_to projects_url
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "The project has been successfully deleted."
    redirect_to projects_url
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :soft_deadline, :hard_deadline)
  end

  def load_project
    @project = Project.find(params[:id])
  end

  def ensure_ownership
    if @project.user != current_user
      flash[:alert] = "Only the project owner can perform this action."
      redirect_to projects_url
    end
  end
end
