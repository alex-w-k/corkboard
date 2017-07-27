class Api::SearchController < ApplicationController
  def search
    render json: Category.where('name ILIKE ?', "%#{params['query']}%").limit(6) unless params['query'].empty?
  end
end