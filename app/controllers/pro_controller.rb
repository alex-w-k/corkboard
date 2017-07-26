class ProController < ApplicationController
  def show
    @pro = Pro.find(current_user.id)
  end

  def new
    binding.pry
    @oauth_info = OauthParse.new(session[:omniauth_info])
    @services = Service.where(id: params[:service_id])
    @radius = params[:radius].empty? ? "10" : params[:radius]
    session[:radius] = @radius
    session[:service_ids] = Service.pro_service_ids(params[:service_id])
    @pro = Pro.new
  end

  def create
    @pro = Pro.new(pro_params)
    @pro.uid = session[:omniauth_info]['uid'] if omniauth_user

    if @pro.save
      session[:service_ids].each do |id|
        @pro.pro_services.create(service_id: id, radius: session[:radius])
      end
       session[:user_id] = @pro.id
      authy = Authy::API.register_user(
        email: @pro.email,
        cellphone: @pro.phone_number,
        country_code: @pro.country_code
      )
      @pro.update(authy_id: authy.id)
      Authy::API.request_sms(id: @pro.authy_id)
      session.delete(:service_ids)
      session.delete(:radius)
      session.delete(:omniauth_info)
      binding.pry
      redirect_to verify_path
    else
      flash.now[:danger] = @pro.errors.full_messages
      binding.pry
      @services = Service.where(id: session[:service_ids])
      @radius = session[:radius]
      # @pro = Pro.new
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
