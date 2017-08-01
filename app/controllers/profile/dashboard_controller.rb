class Profile::DashboardController < ApplicationController
  def show
    @projects = current_user.projects
  end
end
