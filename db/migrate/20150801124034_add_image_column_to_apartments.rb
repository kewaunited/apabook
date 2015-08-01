class AddImageColumnToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :image_id, :integer
    add_index :apartments, :image_id
  end
end
