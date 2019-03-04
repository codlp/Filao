class StepsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :destroy]
  before_action :set_step, only: [:show, :destroy]

  def index
    @projects = Project.all
    @steps = policy_scope(Step).order(created_at: :desc)
  end

  def show
    @project = @step.project
  end

  def new
    skip_authorization
    @project = Project.find(params[:project_id])
    @step = Step.new
    authorize @step
  end

  def create
    skip_authorization
    @project = Project.find(params[:project_id])
    @step = Step.new(step_params)
    @step.project = @project
    if @step.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    skip_authorization
    @step = Step.find(params[:id])
  end

  def update
    @step = Step.find(params[:id])
    if @step.update_attributes(step_params)
      redirect_to @step
    else
      render 'edit'
    end
  end

  def destroy
    authorize @step
    @step.destroy
    redirect_to projects_path
  end

  def mark_as_completed
    skip_authorization
    @step.status = "Done"
    @step.save
    redirect_to projects_steps_path
  end

  private

  def set_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:name, :project_id)
  end
end
