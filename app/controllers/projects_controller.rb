class ProjectsController < ApplicationController
  def show
    @project = current_user.projects.where(id: params[:id]).first
    @review = @project.build_review
    render file: 'public/404.html' unless @project

  end
end