class TasksController < ApplicationController
  before_action :load_project, only: %i(new create)
  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.project = @project
    @task.user = User.find(params[:task][:user_id])
    @task.is_project_owner?
    if @task.save
      flash.now[:notice] = "The task has been successfully created!"
      redirect_to project_url(@project)
    else
      flash.now[:alert] = "There was an error in saving the task."
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:task_body, :priority, :user_id)
  end

end
