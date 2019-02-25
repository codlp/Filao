class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @projects = policy_scope(project).order(created_at: :desc)
  end

  def show
    @project = project.find(params[:id])
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

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
