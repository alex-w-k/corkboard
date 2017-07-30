class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :update, :destroy]
  
  def index

  end

  def show
    @message = Message.new
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.pro = Pro.find(current_user.id)
    @bid.project = Project.find(params[:bid][:project_id])

    if @bid.save
      if params[:bid][:attachments_attributes]
        @bid.attachments.create(upload: params[:bid][:attachments_attributes]["0"][:upload])
      end
      flash["success"] = bid_placed
      redirect_to pro_dashboard_project_bids_path
    else
      flash.now[:danger] = @bid.errors.full_messages
      render '/pro_dashboard/open_projects/show'
    end
  end

  def update
    @bid.update(status: params[:new_status])
  end

  def destroy
    @bid.destroy
  end

  private

    def bid_params
      params.require(:bid).permit(:amount, :comment, )
    end

    def set_bid
      @bid = Bid.find(params[:id])
    end
end
