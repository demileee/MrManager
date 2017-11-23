class TasksController < ApplicationController
  def index
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
