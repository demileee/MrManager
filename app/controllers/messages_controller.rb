class MessagesController < ApplicationController
  before_action :not_authenticated
  
  def index
  end

  def create
    @message = Message.new(message_params)
    @message.project = Project.find(params[:project_id])
    @message.user = current_user
    error = {error: "Could not save, and error has occured"}

    if @message.save
      respond_to { |format| format.json { render json: @message } }
      # redirect_to project_url(@message.project)
    else
      respond_to { |format| format.json { render json: error } }
      # flash.now[:alert] = "There was an error in saving the message."
      # redirect_to project_url(@message.project)
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
    params.require(:message).permit(:message_body, :announcement)
  end
end
