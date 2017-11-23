class MembersController < ApplicationController
  def index
  end

  def new
    @member = Member.new
    @project = Project.find(params[:project_id])
  end

  def show
  end

  def create
    @member = Member.new
    @project = Project.find(params[:project_id])
    @member.project = @project
    @member.user = User.find_by('email = ?', params[:member][:user])
    puts "************************************"
    puts @member.user
    @member.role = params[:member][:role]

    if @member.save
      redirect_to project_url(@project)
    else
      flash[:alert] = "That user doesn't exist"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
