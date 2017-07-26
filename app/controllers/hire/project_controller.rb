class Hire::ProjectController < ApplicationController
  def new
    @service = Service.find(params[:service])
    @project = Project.new
  end

  def create
    project = Project.create(zipcode:     params[:project][:zipcode],
                             recurring:   params[:project][:recurring],
                             description: params[:project][:description],
                             timeline:    params[:project][:timeline],
                             requester:   current_user,
                             service_id:  params[:project][:service_id])
    if params[:project][:attachments_attributes]
      project.attachments.create(upload: params[:project][:attachments_attributes]["0"][:upload])
    end
    flash[:success] = "Project Successfully Submitted"
    redirect_to new_project_confirmation_path(project)
  end

  def confirmation
    @project = Project.find(params[:id])
  end
  
end
