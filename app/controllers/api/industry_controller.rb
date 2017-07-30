class Api::IndustryController < ApplicationController
  def index
    render json: Industry.all
  end
end