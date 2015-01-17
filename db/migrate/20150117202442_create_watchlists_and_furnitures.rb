class CreateWatchlistsAndFurnitures < ActiveRecord::Migration
  def change
    create_table :furnitures_watchlists do |t|
      t.belongs_to :watchlist, index: true
      t.belongs_to :furniture, index: true
    end
  end
end
