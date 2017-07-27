module AuthyConcern
  extend ActiveSupport::Concern

  def authy_authorize(user)
    authy = register(user)
    user.update(authy_id: authy.id)
    Authy::API.request_sms(id: user.authy_id)
  end

  def register(user)
    Authy::API.register_user(
        email: user.email,
        cellphone: user.phone_number,
        country_code: user.country_code
      )
  end

  def resend_token
    Authy::API.request_sms(id: current_user.authy_id)
    flash[:notice] = 'Verification code re-sent'
  end

  def verify_token
    Authy::API.verify(id: current_user.authy_id, token: params[:token])
  end
end