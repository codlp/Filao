class TasksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :destroy]
  before_action :set_task, only: [:show, :destroy]

  def index
    @projects = Project.all
    @tasks = policy_scope(task).order(created_at: :desc)
  end

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def new
    skip_authorization
    @project = Project.find(params[:project_id])
    @task = Task.new
    authorize @task
  end

  def create
    skip_authorization
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    @task.project = @project
    if @task.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    skip_authorization
    @task = Task.find(params[:id])
  end

  def update
    skip_authorization
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    authorize @task
    @task.destroy
    redirect_to projects_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :deliverable, :start_date, :end_date)
  end
end
