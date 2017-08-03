class AppearanceChannel < ApplicationCable::Channel

  def subscribed
    current_user.appear
    stream_from "appearance_#{params[:channel]}"
  end

  def unsubscribed
    current_user.disappear
  end

  def appear(data)
    current_user.appear(on: data["appearing_on"], user_id: data[current_user.id])
    receive(data)
  end

  def receive(data)
    ActionCable.server.broadcast("appearance_#{params[:channel]}", data)
  end

  def away
    # current_user.away
    ActionCable.server.broadcast("appearance_#{params[:channel]}", appearing_on: "offline")
  end

end
