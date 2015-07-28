class AddNameColumnToApartmentModel < ActiveRecord::Migration
  def change
    add_column :apartments, :name, :string
  end
end
