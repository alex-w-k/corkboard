class UsersController < ApplicationController
  before_filter :omniauth_user

  def new
    @user = User.new
    @oauth_info = OauthParse.new(session[:omniauth_info])
  end

  def create
    binding.pry
    @user = User.new(user_params)
    @user.uid = session[:omniauth_info]['uid'] if omniauth_user
    if @user.save
      session[:user_id] = @user.id
      authy = Authy::API.register_user(
        email: @user.email,
        cellphone: @user.phone_number,
        country_code: @user.country_code
      )
      @user.update(authy_id: authy.id)
      Authy::API.request_sms(id: @user.authy_id)
      session.delete(:omniauth_info)
      redirect_to profile_dashboard
    else
      flash.now[:danger] = @user.errors.full_messages
      render :new
    end
  end

  def verify
    @user = current_user
    token = Authy::API.verify(id: @user.authy_id, token: params[:token])
    if token.ok?
      @user.update(verified: true)
      flash[:success] = "You successfully verified your account!"
      user_redirect(current_user)
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end

  def resend
    @user = current_user
    Authy::API.request_sms(id: @user.authy_id)
    flash[:notice] = 'Verification code re-sent'
    redirect_to verify_path
  end
  
  def show_verify
    return redirect_to new_user_path unless session[:user_id]
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :zipcode,
                                 :full_phone,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end

end
