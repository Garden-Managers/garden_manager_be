class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :frost_date
      t.integer :maturity
      t.string :picture

      t.timestamps
    end
  end
end
