class AddImageColumnsToApartment < ActiveRecord::Migration
  def change
    add_column :apartments, :image_uid,  :string
    add_column :apartments, :image_name, :string
  end
end
