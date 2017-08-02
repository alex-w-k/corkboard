class Api::V1::Projects::FindController < ApplicationController
  def index
    @projects = Project.where(find_project_params)
    render 'api/v1/projects/index'
  end

  private

    def find_project_params
      params.permit(:requester_id, :status)
    end
end
