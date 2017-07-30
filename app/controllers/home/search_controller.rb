class Home::SearchController < ApplicationController
  def index
    industry  =   Industry.where('name ILIKE ?', "#{search_params}%").first
    category  =   Category.where('name ILIKE ?', "#{search_params}%").first
    
    return redirect_to hire_industry_category_path(category.industry.slug, category.slug) if category
    return redirect_to hire_industry_path(industry) if industry
  end

  private
    
    def search_params
      params[:service_search]
    end
end