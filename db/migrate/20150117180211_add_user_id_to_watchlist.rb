class AddUserIdToWatchlist < ActiveRecord::Migration
  def change
    add_reference :watchlists, :user, index: true
  end
end
