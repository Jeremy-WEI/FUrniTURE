class AddWatchlistIdToFurnitures < ActiveRecord::Migration
  def change
    add_reference :furnitures, :watchlist, index: true
  end
end
