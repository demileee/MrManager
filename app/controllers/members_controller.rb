class MembersController < ApplicationController
  def index
  end

  def new
    @project = Project.find(params[:project_id])
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
    @project = Project.find(params[:project_id])
    @member = @project.members.build
    @member.project = @project
    @member.user = User.find_by('email = ?', params[:member][:user])
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
    UserMailer.new_member_email(@new_member_email).deliver_now
    flash[:notice] = "An invitation email has been sent to #{@new_member_email}."
    redirect_to new_project_member_url
  end

end
