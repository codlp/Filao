class TasksController < ApplicationController
<<<<<<< HEAD

=======
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_task, only: [:show, :new, :destroy]

  def index
    @projects = Project.all
    @tasks = policy_scope(task).order(created_at: :desc)
  end

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    authorize @task
    @task.project = @project
    @task.user = current_user
    if @task.save
      redirect_to user_tasks_path
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def accept
    skip_authorization
    @task.status = "Accepted"
    @task.save
    redirect_to projects_tasks_path
  end

  def decline
    skip_authorization
    @task.status = "Declined"
    @task.save
    redirect_to projects_tasks_path
  end_date

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :start_at, :end_at)
  end
>>>>>>> ad3d2999b7e615e29d965b7d0da59f84abdc8f0d
end
