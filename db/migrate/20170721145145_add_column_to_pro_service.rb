class AddColumnToProService < ActiveRecord::Migration[5.0] 
  def change 
    add_column :pro_services, :radius, :string 
  end 
end