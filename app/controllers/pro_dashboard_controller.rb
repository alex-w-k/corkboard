class ProDashboardController < ApplicationController

  def index
    @pro = Pro.find(current_user.id)
    @bids = Bid.where(user_id: current_user.id)
  end

end
