class AuthyController < ApplicationController
  include AuthyConcern

  def new
    @user = current_user
    if @user.save
      authy_register(@user)
    else
      render :authy
    end
  end

  def verify
    @user = current_user
    token = verify_token
    if token.ok?
      @user.update(verified: true)
      flash[:success] = "You have authorized your account!"
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
end
