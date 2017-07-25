class AddProIdColumnToProServices < ActiveRecord::Migration[5.0]
  def change
    add_reference :pro_services, :pro, foreign_key: true
  end
end
