module FormHelper
  def user_form_first_name
    case
    when @oauth_info
      @oauth_info.first_name
    when @pro
      @pro.first_name
    when @user
      @user.first_name
    else
      ''
    end
  end

  def user_form_last_name
    case
    when @oauth_info
      @oauth_info.last_name
    when @pro
      @pro.last_name
    when @user
      @user.last_name
    else
      ''
    end
  end
  def user_form_email
    case
    when @oauth_info
      @oauth_info.email
    when @pro
      @pro.email
    when @user
      @user.email  
    else
      ''
    end
  end
end