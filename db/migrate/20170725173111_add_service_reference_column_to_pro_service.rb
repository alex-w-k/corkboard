class AddServiceReferenceColumnToProService < ActiveRecord::Migration[5.0]
  def change
    add_reference :pro_services, :service, foreign_key: true
  end
end
