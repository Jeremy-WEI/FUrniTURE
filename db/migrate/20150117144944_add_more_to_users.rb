class AddMoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :introduction, :string
  end
end
