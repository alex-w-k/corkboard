class Hire::ProjectController < ApplicationController
  def new
    @service = Service.find(params[:service])
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    add_attachment if attachment_params
    
    if @project.save
      flash[:success] = "Project Successfully Submitted"
      redirect_to project_path(@project)
    else 
      @service = Service.find(params[:service])
      flash[:danger] = @project.errors.full_messages
      render :new
    end
  end
  
  private

    def add_attachment
      @project.attachments.create(upload: attachment_params["0"][:upload])
    end

    def project_params
      requester = {requester_id: current_user.id}
      params.require(:project).permit(:zipcode, :recurring, :description, :timeline, :service_id).merge!(requester)
    end
    
    def attachment_params
      params.require(:project)[:attachments_attributes]
    end
end
