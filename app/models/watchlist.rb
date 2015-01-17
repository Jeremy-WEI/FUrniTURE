class Watchlist < ActiveRecord::Base
  belongs_to :user
  has_many :furnitures
end
