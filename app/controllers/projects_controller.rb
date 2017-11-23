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

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
