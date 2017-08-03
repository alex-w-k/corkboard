class BidsController < ApplicationController
  include Attachments
  before_action :set_bid, only: [:show, :update, :destroy]

  def index
  end

  def show
    @message = Message.new
  end

  def create
    @bid = Bid.new(bid_params)

    if @bid.save
      add_attachment(@bid, :bid) if attachment_params(:bid)
      flash["success"] = bid_placed
      redirect_to bid_path(@bid)
    else
      @project = Project.find(bid_params[:project_id])
      flash.now[:danger] = @bid.errors.full_messages
      render '/pro_dashboard/open_projects/show'
    end
  end

  def update
    BidHelper.new(@bid, params[:new_status]).update_bid
    #@bid.update_statuses(params[:new_status])
    if current_user.pro?
      redirect_to pro_dashboard_index_path
    else
      redirect_to project_path(@bid.project)
    end
  end

  def destroy
    @bid.destroy
  end

  private

    def bid_params
      pro = {user_id: current_user.id}
      params.require(:bid).permit(:amount, :comment, :project_id, :new_status).merge(pro)
    end

    def set_bid
      @bid = Bid.find(params[:id])
    end
end
