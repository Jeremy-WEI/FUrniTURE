class WatchlistsController < ApplicationController
  before_action :set_watchlist, only: [:show, :edit, :update, :destroy, :unwatch]

  respond_to :html

  def index
    @watchlists = Watchlist.all
    respond_with(@watchlists)
  end

  def show
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
    render '/my_watch_list'
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
