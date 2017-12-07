class TasksController < ApplicationController
  before_action :not_authenticated
  before_action :load_project, except: %i(index)
  before_action :find_task, except: %i(index new create show)

  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.project = @project

    if @task.project.user == current_user
      @task.user = User.find(params[:task][:user_id])
    else
      @task.user = current_user
    end
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

  def completed
    @task.completed
    if @task.save
      redirect_to request.referer
    else
      render project_url(@project)
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Task for #{@task.user.first_name} has been successfully updated!"
      redirect_to project_url(@project)
    else
      render :edit
    end

  end

  def destroy
    @task.destroy
    flash[:notice] = "The task has been successfully deleted."
    redirect_to project_url(@project)
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:task_body, :priority, :user_id)
  end

end
