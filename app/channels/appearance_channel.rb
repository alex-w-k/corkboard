class AppearanceChannel < ApplicationCable::Channel

  def subscribed
    # current_user.appear
    stream_from "appearance_#{params[:channel]}"
    self.receive("#{current_user.id}", "#{current_user.full_name}")
  end

  def unsubscribed
    current_user.disappear
  end

  # def appear(data)
  #   # current_user.appear(on: data["appearing_on"], user_id: data[current_user.id])
  #   # data.merge({id: current_user.id})
  #   receive(data)
  # end

  def receive(id, name)
    ActionCable.server.broadcast("appearance_#{params[:channel]}", [id, name])
  end

  def away
    # current_user.away
    ActionCable.server.broadcast("appearance_#{params[:channel]}", appearing_on: "offline")
  end

end
