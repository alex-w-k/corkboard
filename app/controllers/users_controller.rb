class UsersController < ApplicationController
  before_action :omniauth_user
  
  def new
    @user = User.new
    @oauth_info = OauthParse.new(session[:omniauth_info])
  end

  def create
    @user = User.new(user_params)
    @user.uid = session[:omniauth_info]['uid'] if omniauth_user

    if @user.save
      session.delete(:omniauth_info)
      session[:user_id] = @user.id
      session[:authenticated] = true
      redirect_to profile_dashboard_path
    else
      flash.now[:danger] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      flash.now[:danger] = @user.errors.full_messages
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :zipcode,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end

end
