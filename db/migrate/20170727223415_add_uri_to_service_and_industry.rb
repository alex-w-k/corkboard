class AddUriToServiceAndIndustry < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :uri, :string
    add_column :services, :search_service_id, :string
    add_column :industries, :uri, :string
    add_column :industries, :search_service_id, :string
    add_column :categories, :search_service_id, :string
  end
end
