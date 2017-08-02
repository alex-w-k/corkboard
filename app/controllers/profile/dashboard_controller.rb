class Profile::DashboardController < ApplicationController
  def show
    @projects = current_user.projects
    @token = JsonWebToken.encode({id: current_user.id})
  end

end
