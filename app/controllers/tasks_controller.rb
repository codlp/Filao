class TasksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :destroy]
  before_action :set_task, only: [:show, :destroy, :mark_as_done, :mark_as_undone]

  def index
    @steps = Step.all
    @tasks = policy_scope(task).order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
    @step = @task.step

  end

  def new
    skip_authorization
    @step = Step.find(params[:step_id])
    @task = Task.new
    authorize @task
  end

  def create
    skip_authorization
    @task = Task.new(task_params)
    @project = Project.find(params[:project_id])
    @task.project = @project
    if @task.save
      @step = @task.step
      redirect_to project_path(@project, step_id: @step.id)
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
    @project = @task.project
    @task.project = @project
    @step = @task.step
    redirect_to project_path(@project, step_id: @step.id)
    else
      render 'edit'
    end
  end

  def destroy
    authorize @task
    @project = @task.project
    @task.project = @project
    @step = @task.step
    @task.destroy
    redirect_to project_path(@project, step_id: @step.id)
  end

  def mark_as_done
    skip_authorization
    @step = Step.find(params[:step_id])
    @tasks = @step.tasks
    @task.is_done = true
    @task.save
    @project = @task.project
    redirect_to project_path(@project, step_id: @step.id)
  end

  def mark_as_undone
    skip_authorization
    @step = Step.find(params[:step_id])
    @tasks = @step.tasks
    @task.is_done = false
    @task.save
    @project = @task.project
    redirect_to project_path(@project, step_id: @step.id)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :project_id, :user_id, :step_id, :description, :deliverable, :start_date, :end_date)
  end
end
