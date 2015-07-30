class AddOwnerToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :owner_id, :integer
    add_index :apartments, :owner_id
  end
end
