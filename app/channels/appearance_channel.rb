class AppearanceChannel < ApplicationCable::Channel

  def subscribed
    stream_from "appearance_#{params[:channel]}"
    self.receive("#{current_user.id}", "#{current_user.full_name}")
  end

  def unsubscribed
    ActionCable.server.broadcast("appearance_#{params[:channel]}", [id, name])
  end

  def receive(id, name)
    ActionCable.server.broadcast("appearance_#{params[:channel]}", [id, name])
  end

  def away
    ActionCable.server.broadcast("appearance_#{params[:channel]}", appearing_on: "offline")
  end

end
