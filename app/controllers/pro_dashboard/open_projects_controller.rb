class ProDashboard::OpenProjectsController < ApplicationController
  attr_accessor :to_bid_on
  before_action :set_pro, only: [:index]

  def index
    @bid = Bid.new
    @projects = OpenProjectPresenter.new(@pro)
  end

  def show
    @bid = Bid.new
    @project = Project.find(params[:id])
  end
  
  private
  
    def set_pro
      @pro = Pro.find(current_user.id)
    end
end
