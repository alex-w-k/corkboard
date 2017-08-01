class Api::V1::Projects::ProjectsController < ApiBaseController
  def update
    if token_valid?
      Project.update(params[:id], project_params)
      render 'api/v1/projects/show'
    else
      head :no_content
    end
  end

  private

    def project_params
      params.require(:project).permit(:id, :status)
    end

    def token
      params.require(:project).permit(:token)
    end

    def token_valid?
      user_id = Project.find(params[:id]).requester.id
      JsonWebToken.decode(token[:token])[:id] == user_id
    end
end
