class AddAddressToFurnitures < ActiveRecord::Migration
  def change
    add_column :furnitures, :address, :string
  end
end
