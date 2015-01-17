class AddOldnessToFurnitures < ActiveRecord::Migration
  def change
    add_column :furnitures, :oldness, :float
  end
end
