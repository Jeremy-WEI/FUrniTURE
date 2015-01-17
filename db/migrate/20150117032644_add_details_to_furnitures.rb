class AddDetailsToFurnitures < ActiveRecord::Migration
  def change
    add_reference :furnitures, :user, index: true
  end
end
