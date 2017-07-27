class ProjectsController < ApplicationController
  def show
    @project = current_user.projects.where(id: params[:id]).first
    if @project
      @review = @project.build_review
    else
      render file: 'public/404.html'
    end
  end
end