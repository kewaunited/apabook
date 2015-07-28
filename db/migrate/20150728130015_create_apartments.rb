class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :door_number
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.text :room_description
      t.integer :floor

      t.timestamps null: false
    end
  end
end
