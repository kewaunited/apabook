class AddPricesColumnsToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :day_price, :decimal
    add_column :apartments, :week_price, :decimal
  end
end
