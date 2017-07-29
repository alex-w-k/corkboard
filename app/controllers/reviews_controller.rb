class ReviewsController < ApplicationController

  before_action :set_project, :project_owner, :project_closed

  def create
    @review = @project.create_review(review_params)
    redirect_to project_path(@project)
  end

  def edit

  end

  private

  def set_project
    @project = Project.find_by(id: params["project_id"].to_i)
  end

  def project_owner
    @project.requester_id == current_user.id
  end

  def project_closed
    @project.closed?
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id)
  end
end