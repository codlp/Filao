class DocumentsController < ApplicationController

  def new
    @task = Task.find(params[:task_id])
    @document = Document.new
  end

  def create
    skip_authorization
    @document = Document.new(document_params)
    @document.user = current_user
    @document.task = Task.find(params[:task_id])
    @document.save
    redirect_to project_path(@document.task.project)
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
  end

  private

  def document_params
    params.require(:document).permit(:name, :name_cache, :task_id, :upload_date)
  end

end
