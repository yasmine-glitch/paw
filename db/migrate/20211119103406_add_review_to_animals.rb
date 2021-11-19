class AddReviewToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_column :animals, :review, :string
  end
end
