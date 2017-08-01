class NewProPresenter
  attr_reader :pro
  def initialize(session, params={}, pro = Pro.new)
    @session = session
    @params = params
    @pro = pro
  end

  def location
    @location ||= Geokit::Geocoders::GoogleGeocoder.geocode(collection(:zip))
  end

  def radius
    @radius ||= collection(:radius).empty? ? "10" : collection(:radius)
  end

  def oauth_info
    @oauth_info ||= OauthParse.new(@session[:omniauth_info])
  end

  def services
    @services = Service.where(id: collection(:service_id))
  end

  def collection(key)
    key.in?(params) ? params[key] : session[key]
  end

  def set_session_variables
    session[:service_id] = @params[:service_id]
    session[:zip] = @params[:zip]
    session[:radius] = @params[:radius].empty? ? "10" : @params[:radius]
  end

  private
    attr_reader :session, :params
end