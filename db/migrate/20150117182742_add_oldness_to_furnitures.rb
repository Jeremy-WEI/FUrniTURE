class AddOldnessToFurnitures < ActiveRecord::Migration
  def change
    add_column :furnitures, :oldness, :string
  end
end
