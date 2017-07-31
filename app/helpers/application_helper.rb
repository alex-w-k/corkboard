module ApplicationHelper
  include FormHelper

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
    if logged_in? && current_user.pro? == false
      link_to 'Dashboard', profile_dashboard_path
    elsif logged_in? && current_user.pro?
      link_to 'Dashboard', pro_dashboard_index_path
    end
  end

  def new_project_button
    if logged_in?
      link_to 'New Project', root_path
    end
  end

end
