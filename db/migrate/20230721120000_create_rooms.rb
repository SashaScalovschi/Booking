class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :area
      t.boolean :balcony
      t.boolean :tv
      t.boolean :air_conditioner

      t.timestamps
    end
  end
end