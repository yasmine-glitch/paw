class AddSpeciesDescriptionQualityToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_column :animals, :species, :string
    add_column :animals, :description, :string
    add_column :animals, :quality, :string
  end
end
