class Profile::DashboardController < ApplicationController
  def show
    @projects = current_user.projects
    @token = "CharlieWasHere"
  end
end
