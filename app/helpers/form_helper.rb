module FormHelper
  def user_form_first_name
    if @oauth_info
      @oauth_info.first_name
    elsif @pro.first_name
      @pro.first_name
    else
      ''
    end
  end

  def user_form_last_name
    if @oauth_info
      @oauth_info.last_name
    elsif @pro.last_name
      @pro.last_name
    else
      ''
    end
  end
  def user_form_email
    if @oauth_info
      @oauth_info.email
    elsif @pro.email
      @pro.email
    else
      ''
    end
  end
end