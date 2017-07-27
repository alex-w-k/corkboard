class Api::SearchController < ApplicationController
  def search
    if params['query'].empty?
      render json: {}.to_json
    else
      categories = Category.where('name ILIKE ?', "%#{params['query']}%").limit(6)
      binding.pry
      categories
    end
  end
end