class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :destroy, :edit]
  before_action :set_message, only: [:show, :destroy]

  def index
    @tasks = Task.all
    @messages = policy_scope(message).order(created_at: :desc)
  end

  def new
    skip_authorization
    @task = Task.find(params[:task_id])
    @message = Message.new
    authorize @message
  end

  def create
    skip_authorization
    @task = Task.find(params[:task_id])
    @message = Message.new(message_params)
    @step = @task.step
    @project = @step.project
    @message.task = @task
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.html { redirect_to projects_path }
        format.js  # <-- will render `app/views/messages/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to projects_path }
        format.js  # <-- idem
      end
    end
  end

  def edit
    @message = Message.find(params[:id])
    @task = @message.task
  end

  def destroy
    skip_authorization
    @message.destroy
    redirect_to project_path(@message.task.step.project)
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
   params.require(:message).permit(:content, :task_id, :user_id)
  end
end

