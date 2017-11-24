class MessagesController < ApplicationController

  def index
  end

  def create
    @message = Message.new(message_params)
    @message.project = Project.find(params[:project_id])
    @message.user = current_user

    if @message.save
      redirect_to project_path(@message.project.id)
    else
      render project_path(@message.project.id)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def message_params
    params.require(:message).permit(:message_body)
  end
end
