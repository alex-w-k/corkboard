class SessionsController < ApplicationController

  def new
  end

  def create
    user = oauth_info ? oauth_login(User.locate_by(oauth_info, true)) : manual_login(User.locate_by(params[:session][:email]))
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def oauth_info
    request.env["omniauth.auth"]
  end

  def oauth_login(user)
   if user && user.new_record?
     session[:omniauth_info] = oauth_info
     redirect_to register_path
   else
     session[:user_id] = user.id
     session[:authenticated] = true
     redirect_to profile_dashboard_path
   end
  end


  def manual_login(user)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:authenticated] = true
      redirect_to profile_dashboard_path
    else
      flash.now[:danger] =  "Incorrect e-mail and password combination."
      render :new
    end
  end
end
