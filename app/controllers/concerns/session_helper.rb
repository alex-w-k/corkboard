module SessionHelper
  extend ActiveSupport::Concern
  
  def clear_session(arr)
    arr.each{|k| session.delete(k)}
  end
end