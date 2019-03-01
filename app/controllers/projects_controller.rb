class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :new, :create, :edit, :is_done]
  before_action :set_project, only: [:show, :edit, :update, :destroy, :is_done]

  def index
    @projects = policy_scope(Project).order(created_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
    @document = Document.new
    # TODO: progress bar
    # Recuperer toutes les taches du projet
    @tasks = Task.all
    # Recuperer toutes les taches qui sont is done
    @done_tasks = Task.where(is_done: true)
    # Calculer le pourcentage des taches realisees
    # Le stocker dans une variable qui sera exposee a la vue : @progress
    # raise
    @progress = (@done_tasks.size).fdiv(@tasks.size) * 100
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    @project.user = current_user
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def is_done
    skip_authorization
    @task = Task.find(params[:task_id])
    @task.is_done
    @task.save
    redirect_to rooftops_tasks_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def project_params
    params.require(:project).permit(:name, :description, :category, :company, :start_date, :end_date)
  end
end
