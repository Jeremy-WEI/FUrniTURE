class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  def welcome

  end

  def search
    tag = @search.tag
    price = @search.price
    address = @search.address
    # @miles = @search.distance
    @miles = 20
    # @current_location = Geokit::Geocoders::GoogleGeocoder.geocode address
    @current_location = Geokit::Geocoders::GoogleGeocoder.geocode address
    furnitures = Furniture.all;
    @furnitures = [];
    if @current_location.success
      furnitures.each do |f|
        location = Geokit::LatLng.new(f.latitude, f.longitude)
        if f.type == tag and f.price < price and location.distance_to(@current_location) <= @miles
          @furnitures.append(f)
        end
      end
    end
    render 'furnitures/index'
  end

end
