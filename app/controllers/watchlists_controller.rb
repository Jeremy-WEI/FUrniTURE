class WatchlistsController < ApplicationController
  before_action :set_watchlist, only: [:show, :edit, :update, :destroy, :unwatch]

  respond_to :html

  def index
    @watchlists = Watchlist.all
    respond_with(@watchlists)
  end

  def show
    address = current_user.address
    # @currentLocation = address
    tmp = Geokit::Geocoders::GoogleGeocoder.geocode(address)
    if tmp.success
      @currentLocation = [tmp.lat, tmp.lng]
    else
      @currentLocation = nil
    end
    respond_with(@watchlist)
  end

  def new
    @watchlist = Watchlist.new
    respond_with(@watchlist)
  end

  def edit
  end

  def unwatch
    @furniture = @watchlist.furnitures.find(params[:furniture_id])
    if @watchlist && @furniture
      @furniture.watchlists.delete(@watchlist)
    end
    render 'watchlists/show'
    # @furniture.watchlists.destroy(@watchlist)
  end

  def create
    @watchlist = Watchlist.new(watchlist_params)
    @watchlist.save
    respond_with(@watchlist)
  end

  def update
    @watchlist.update(watchlist_params)
    respond_with(@watchlist)
  end

  def destroy
    @watchlist.destroy
    respond_with(@watchlist)
  end


  private
    def set_watchlist
      @watchlist = current_user.watchlist
    end

    def watchlist_params
      params[:watchlist]
    end
end
