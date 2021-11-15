class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :address
      t.integer :age
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.references :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
