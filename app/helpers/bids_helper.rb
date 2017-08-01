module BidsHelper
  def details
    pro_user? ? 'client' : 'pro'
  end
end