class Api::CategoryController < ApplicationController
  def index
    render json: Industry.find(params['query']).categories
  end
end