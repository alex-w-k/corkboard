class ReviewsController < ApplicationController
  def create
    @project = Project.find_by(id: params["project_id"].to_i)
    @review = @project.create_review(review_params)
    redirect_to project_path(@project)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id)
  end
end