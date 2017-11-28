class TasksController < ApplicationController
  before_action :load_project, except: %i(index)

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
    @task = Task.find(params[:id])
  end

  def completed
    @task = Task.find(params[:id])
    @task.completed
    if @task.save
      redirect_to request.referer
    else
      render project_url(@project)
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.save
      flash[:notice] = "Task for #{@task.user.first_name} has been successfully updated!"
      redirect_to projects_url
    else
      render :edit
    end

  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "The task has been successfully deleted."
    redirect_to project_url(@project)
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:task_body, :priority, :user_id)
  end

end
