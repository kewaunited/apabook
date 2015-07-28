class AddGuestsCountToApartment < ActiveRecord::Migration
  def change
    add_column :apartments, :min_guests, :integer
    add_column :apartments, :max_guests, :integer
  end
end
