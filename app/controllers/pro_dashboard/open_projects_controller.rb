class ProDashboard::OpenProjectsController < ApplicationController
  attr_accessor :to_bid_on

  def index
    pro = Pro.find(current_user.id)
    # binding.pry
    pro_location = Geokit::Geocoders::GoogleGeocoder.geocode(pro.zipcode)
    # @open_projects = @pro.open_projects

    @to_bid_on = Project.open.map do |open_project|
      binding.pry
      request_location = open_project.zipcode
      distance = @pro_location.distance_to(request_location)
        @to_bid_on << open_project
      if distance < @pro.pro_services.first.radius.to_i
      else
      end
    end
  end

  def show
    @bid = Bid.new
    @project = Project.find(params[:id])
  end
end
