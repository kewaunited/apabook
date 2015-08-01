class RemoveImageColumnsFromApartments < ActiveRecord::Migration
  def change
    remove_column :apartments, :image_uid,  :string
    remove_column :apartments, :image_name, :string
  end
end
