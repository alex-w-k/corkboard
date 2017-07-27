class AddProjectColumnToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :project, foreign_key: true
  end
end
