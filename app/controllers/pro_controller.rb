class ProController < ApplicationController
  include ProConcern
  include AuthyConcern
  include SessionHelper

  def index
    @pros = Pro.all
  end

  def show
    @pro = Pro.find(params[:id])
  end

  def new
    session[:zipcode] = params[:zipcode]
    session[:radius] = params[:radius].empty? ? "10" : params[:radius]
    session[:service_ids] = Service.pro_service_ids(params[:service_id])

    @location = Geokit::Geocoders::GoogleGeocoder.geocode(params[:zip])
    @oauth_info = OauthParse.new(session[:omniauth_info])
    @services = Service.where(id: params[:service_id])
    @pro = Pro.new
  end

  def create
    @pro = Pro.new(pro_params)
    @pro.uid = session[:omniauth_info]['uid'] if omniauth_user
    if @pro.save
      set_services(session[:service_ids], @pro, session[:radius])
      session[:user_id] = @pro.id
      authy_authorize(@pro)
      clear_session([:service_ids, :zipcode, :radius, :omniauth_info])
      redirect_to verify_path
    else
      flash.now[:danger] = @pro.errors.full_messages

      @services = Service.where(id: session[:service_ids])
      @radius = session[:radius]
      @location = Geokit::Geocoders::GoogleGeocoder.geocode(params[:zip])

      render :new
    end
  end

  private


  def pro_params
    params.require(:pro).permit(:first_name,
                                 :last_name,
                                 :zipcode,
                                 :country_code,
                                 :phone_number,
                                 :email,
                                 :uid,
                                 :password,
                                 :password_confirmation)
  end
end
