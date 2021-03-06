class ProjectsController < ApplicationController
  before_action :not_authenticated
  before_action :load_project, only: %i(show edit update destroy)
  before_action :ensure_ownership, only: %i(edit update destroy)

  def index
    @projects = Member.where(user: current_user, invite_accepted: true).sort_by{ |member| member.project.hard_deadline }
    @invites = Member.where(user: current_user, invite_accepted: false).sort_by{ |member| member.created_at }
  end

  def new
    @project = Project.new
  end

  def show
    @members = @project.members.select { |member| member.invite_accepted? }
    @tasks = @project.tasks.order('completed_on DESC, priority DESC')
    @tasks_sorted_by_user = @tasks.sort_by{ |task| task.user.first_name }
    @task = Task.new
    @message = Message.new
    @messages = @project.messages.order('created_at')
    @events = Event.where('project_id = ?', params[:id]).last(5).reverse
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
      flash[:alert] = "Only Mr Manager can perform this action."
      redirect_to projects_url
    end
  end
end
