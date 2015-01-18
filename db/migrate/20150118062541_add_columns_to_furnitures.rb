class AddColumnsToFurnitures < ActiveRecord::Migration
  def change
    add_column :furnitures, :video, :string
  end
end
