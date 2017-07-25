class ProController < ApplicationController
  def show
    @pro = Pro.find(current_user.id)
  end

  def new
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
    # @pro.create_pro_service(service_ids: session[:service_ids], radius: session[:radius])
    if @pro.save
      ConfirmationSender.send_confirmation_to(@pro)
      session[:user_id] = @pro.id
      session.delete(:service_ids)
      session.delete(:radius)
      session.delete(:omniauth_info)
      redirect_to twilio_confirmation_path
    else
      flash.now[:danger] = @pro.errors.full_messages
      render :new
    end
  end

  private


  def pro_params
    params.require(:pro).permit(:first_name,
                                 :last_name,
                                 :zipcode,
                                 :phone_number,
                                 :email,
                                 :uid,
                                 :password,
                                 :password_confirmation)
  end
end
