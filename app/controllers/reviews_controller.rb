class ReviewsController < ApplicationController
  before_action :set_project, :project_owner, :project_closed

  def create
    @review = @project.create_review(review_params)
    redirect_to project_path(@project)
  end

  def edit
    session[:edit_review] = true
    @review = @project.review
    redirect_to project_path(@project)
  end

  def update
    @project.review.update_attributes(review_params)
    @review = @project.review
    session[:edit_review] = nil
    redirect_to project_path(@project)
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