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

  def pro_oauth?
    request.env["omniauth.params"]["user_type"] == "pro"
  end

  def oauth_login(user)
   if user && user.new_record?
     session[:omniauth_info] = oauth_info
     register_redirect(user)
   else
     session[:user_id] = user.id
     session[:authenticated] = true
     user_redirect(user)
   end
  end

  def register_redirect(user)
    if pro_oauth?
      redirect_to new_pro_path(:service_id =>  session[:service_ids])
      flash[:info] = oauth_form
    else
      redirect_to register_path
      flash[:info] = oauth_form
    end
  end


  def manual_login(user)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:authenticated] = true
      user_redirect(user)
    else
      flash.now[:danger] = incorrect_email_password
      render :new
    end
  end
end
