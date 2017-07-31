class ProjectsController < ApplicationController
  def show
    @project = current_user.projects.where(id: params[:id]).first

    render file: 'public/404.html' if @project.nil?
    if @project && @project.review.nil?
      @review = @project.build_review
    end
  end
end