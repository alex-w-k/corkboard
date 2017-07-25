class OauthParse
  attr_reader :email, :name

  def initialize(oauth_info=nil)
    @email = oauth_info['info']['email'] if oauth_info
    @name =  oauth_info['info']['name'] if oauth_info
  end

  def first_name
    name.split(' ')[0] if name
  end

  def last_name
    name.split(' ')[1] if name
  end
end
