class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :quality
      t.string :name

      t.timestamps
    end
  end
end
