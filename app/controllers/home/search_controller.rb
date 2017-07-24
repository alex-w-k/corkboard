class Home::SearchController < ApplicationController
  def index
    category = Category.where('name ILIKE ?', "#{params[:service_search]}").first
    binding.pry
    redirect_to hire_industry_category_path(category.industry.slug, category.slug)
  end
end