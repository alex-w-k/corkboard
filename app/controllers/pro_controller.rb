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
    @presenter = NewProPresenter.new(session, params)
    @presenter.set_session_variables
  end

  def create
    @pro = Pro.new(pro_params)
    @pro.uid = session[:omniauth_info]['uid'] if omniauth_user

    if @pro.save
      set_services(session[:service_id], @pro, session[:radius])
      clear_session([:service_id, :zipcode, :radius, :omniauth_info])
      session[:user_id] = @pro.id
      session[:authenticated] = true
      redirect_to pro_dashboard_index_path
    else
      flash.now[:danger] = @pro.errors.full_messages
      @presenter = NewProPresenter.new(session, params, @pro)
      render :new
    end
  end

  private

  def pro_params
    params.require(:pro).permit(:first_name,
                                :last_name,
                                :zipcode,
                                :email,
                                :uid,
                                :password,
                                :password_confirmation)
  end
end
