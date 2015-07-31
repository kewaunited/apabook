class AddMinimumStayToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :min_stay, :integer
  end
end
