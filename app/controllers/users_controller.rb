class UsersController < ApplicationController
  before_action :omniauth_user
  include AuthyConcern
  
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
      authy_authorize(@user)
      session.delete(:omniauth_info)
      redirect_to profile_dashboard
    else
      flash.now[:danger] = @user.errors.full_messages
      render :new
    end
  end

  def verify
    token = verify_token
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
    resend_token
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
