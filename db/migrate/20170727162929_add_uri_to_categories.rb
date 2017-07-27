class AddUriToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :uri, :string
  end
end
