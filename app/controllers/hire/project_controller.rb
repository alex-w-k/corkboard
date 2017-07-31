class Hire::ProjectController < ApplicationController
  include Attachments

  def new
    @service = Service.find(params[:service])
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    
    if @project.save
      add_attachment(@project, :project) if attachment_params(:project)
      flash[:success] = "Project Successfully Submitted"
      redirect_to project_path(@project)
    else 
      @service = Service.find(params[:service])
      flash[:danger] = @project.errors.full_messages
      render :new
    end
  end
  
  private

    def project_params
      requester = {requester_id: current_user.id}
      params.require(:project).permit(:zipcode, :recurring, :description, :timeline, :service_id).merge!(requester)
    end
end
