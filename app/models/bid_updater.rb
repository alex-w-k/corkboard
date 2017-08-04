class BidUpdater
  attr_reader :bid, :bid_params

  def initialize(bid, bid_params)
    @bid = bid
    @bid_params = bid_params
  end

  def update_bid
    @bid.update!(status: @bid_params)
    return if @bid_params == "withdrawn" || @bid_params == "rejected"
    if @bid_params == "accepted"
      accept_bids
    end
  end

  def accept_bids
    @bid.close_other_bids
    @bid.project.update!(status: "accepted")
  end
end