require 'openssl'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  def welcome

  end

  # def search
  #   tag = @search.tag
  #   price = @search.price
  #   address = @search.address
  #   @miles = @search.distance
  #   @currentLocation = Geokit::Geocoders::GoogleGeocoder.geocode address
  #   furnituresAll = Furniture.all;
  #   @furnitures = [];
  #   if @currentLocation.success
  #     furnituresAll.each do |f|
  #       location = Geokit::LatLng.new(f.latitude, f.longitude)
  #       if f.type == tag and f.price < price and location.distance_to(@currentLocation) <= @miles
  #         @furnitures.append(f)
  #       end
  #     end
  #   end
  # render "furnitures/index"
  # end



end
