# class AppearanceChannel < ApplicationCable::Channel
#
#   def subscribed
#     current_user.appear
#     stream_from 'appearance'
#   end
#
#   def unsubscribed
#     current_user.disappear
#   end
#
#   def appear(data)
#     current_user.appear(on: data["action"])
#   end
#
#   def away
#     current_user.away
#   end
# end
