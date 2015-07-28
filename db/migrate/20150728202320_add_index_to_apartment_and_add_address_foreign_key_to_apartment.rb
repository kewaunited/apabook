class AddIndexToApartmentAndAddAddressForeignKeyToApartment < ActiveRecord::Migration
  def change
    add_column :apartments, :address_id, :integer
    add_index :apartments, :address_id
  end
end
