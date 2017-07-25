class RemoveServiceIdsFromProServices < ActiveRecord::Migration[5.0]
  def change
    remove_column :pro_services, :service_ids
  end
end
