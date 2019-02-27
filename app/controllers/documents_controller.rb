class DocumentsController < ApplicationController

  def create
    skip_authorization
    @document = Document.new(document_params)
    @document.user = current_user

    # TODO
    @document.task = Task.find(params[:task_id])
    raise
    if @document.save
    redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def document_params
    params.require(:document).permit(:name, :name_cache)
  end
end
