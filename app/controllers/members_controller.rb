class MembersController < ApplicationController

  before_action :find_project, only: [:new, :create, :invite]
  
  def index
  end

  def new
    @member = @project.members.build
    user_mail = User.all.map { |user| user.email }
    respond_to do |format|
      format.html
      format.json { render json: user_mail }
    end
  end

  def show
  end

  def create
    @member = @project.members.build
    @member.project = @project
    @member.user = User.find_by('email = ?', params[:member][:user])
    @member.role = params[:member][:role]

    if @member.save
      redirect_to project_url(@project)
    else
      flash[:alert] = "This user doesn't exist, please invite them to Mr Manager."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def join
    @member = Member.find(params[:id])
    @member.join_project
    if @member.save
      flash[:notice] = "#{@member.project.title} joined"
      redirect_to request.referer
    else
      flash[:alert] = "Did not successfully join"
      render request.referer
    end
  end

  def invite
    @new_member_email = params[:email][0]
    @current_user = current_user

    if User.find_by(email: @new_member_email)
      flash[:alert] = "This user already exists, please add them as a member to your project."
    else
      UserMailer.new_member_email(@new_member_email, @project.title, @current_user.first_name).deliver_now
      flash[:notice] = "An invitation email has been sent to #{@new_member_email}."
    end
    redirect_to new_project_member_url
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end
