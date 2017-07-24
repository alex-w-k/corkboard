module ApplicationHelper
  def login_button
    if logged_in?
      link_to 'Logout', logout_path, method: :delete
    else
      link_to 'Log In', login_path
    end
  end

  def sign_up_button
    if !logged_in?
      link_to 'Sign Up', choose_account_path
    end
  end

  def dashboard_button
    if logged_in?
      link_to 'Dashboard', profile_dashboard_path
    end
  end
  
end
