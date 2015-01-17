class CreateFurnitures < ActiveRecord::Migration
  def change
    create_table :furnitures do |t|
      t.string :title
      t.string :tag
      t.string :picture1
      t.string :picture2
      t.string :picture3
      t.string :picture4
      t.float :price
      t.text :description
      t.string :email
      t.string :phone
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
