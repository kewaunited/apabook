class AddActiveColumnToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :active, :boolean
  end
end
