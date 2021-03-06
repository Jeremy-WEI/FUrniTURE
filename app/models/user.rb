class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :watchlist, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :furnitures, dependent: :destroy
end
