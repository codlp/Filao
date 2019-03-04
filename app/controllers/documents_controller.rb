class DocumentsController < ApplicationController

  def new
    @task = Task.find(params[:task_id])
    @document = Document.new
  end

  def create
    skip_authorization
    @document = Document.new(document_params)
    @task = Task.find(params[:task_id])
    @document.user = current_user
    @document.task = @task
    if @document.save
      @project = @task.project
      @step = @task.step
      redirect_to project_path(@project, step_id: @step.id)
    else
      render "projects/show"
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    @project = @task.project
    @step = @task.step
    redirect_to project_path(@project, step_id: @step.id)
  end

  private

  def document_params
    params.require(:document).permit(:name, :name_cache, :task_id, :upload_date, :step_id, :project)
  end
end
