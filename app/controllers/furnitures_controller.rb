class FurnituresController < ApplicationController

  # before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_furniture, only: [:show, :edit, :update, :destroy, :add_to_watch_list]

  # GET /furnitures
  # GET /furnitures.json
  def index
    @furnitures = []
    Furniture.all.each do |f|
      if f.user_id != current_user.id
          @furnitures.append(f)
      end
    end
    address = current_user.address
    tmp = Geokit::Geocoders::GoogleGeocoder.geocode(address)
    @currentLocation = [tmp.lat, tmp.lng]
    @miles = 5
    @furnitures.sort!{|x,y| Geokit::LatLng.new(x.latitude, x.longitude).distance_to(@currentLocation)<=>Geokit::LatLng.new(y.latitude, y.longitude).distance_to(@currentLocation)}
    @count = @furnitures.size
    @tag = "furnitures"
    @price = ">$1000"
  end

  def search
    @tag = params[:tag]
    address = current_user.address
    tmp = Geokit::Geocoders::GoogleGeocoder.geocode(address)
    @currentLocation = [tmp.lat, tmp.lng]
    @price = params[:price]
    @miles = params[:miles]
    furnitureAll = Furniture.all
    @furnitures = []
    furnitureAll.each do |f|
      location = Geokit::LatLng.new(f.latitude, f.longitude)
      if f.user_id != current_user.id and f.tag == @tag and f.price.to_i <= @price.to_i and location.distance_to(@currentLocation) <= @miles.to_i
        @furnitures.append(f)
      end
    end
    @furnitures.sort!{|x,y| Geokit::LatLng.new(x.latitude, x.longitude).distance_to(@currentLocation)<=>Geokit::LatLng.new(y.latitude, y.longitude).distance_to(@currentLocation)}
    @count = @furnitures.size
    render 'furnitures/index'
  end


  # GET /furnitures/1
  # GET /furnitures/1.json
  def show
    address = current_user.address
    # @currentLocation = address
    tmp = Geokit::Geocoders::GoogleGeocoder.geocode(address)
    if tmp.success
      @currentLocation = [tmp.lat, tmp.lng]
      userlocation = Geokit::LatLng.new(@furniture.latitude, @furniture.longitude)
      @distance = userlocation.distance_to(@currentLocation)
    else
      @currentLocation = nil
    end
    @related_furnitures = Furniture.where(tag: @furniture.tag).where.not(id: @furniture.id).order("RANDOM()").limit(4)
  end

  # GET /furnitures/new
  def new
    @furniture = Furniture.new
  end

  # GET /furnitures/1/edit
  def edit
  end

  def add_to_watch_list
    @watchlist = current_user.watchlist
    unless @watchlist.furniture_ids.include?(@furniture.id)
      @watchlist.furnitures << @furniture
    end
    @related_furnitures = Furniture.where(tag: @furniture.tag).where.not(id: @furniture.id).order("RANDOM()").limit(4)
    flash[:notice] = "You watched this furniture"
    render :show
  end

  # POST /furnitures
  # POST /furnitures.json
  def create
    @furniture = Furniture.new(furniture_params)
    @furniture.user = current_user
    @furniture.address = current_user.address
    @furniture.phone = current_user.phone
    @furniture.email = current_user.email
    @location = Geokit::Geocoders::GoogleGeocoder.geocode @furniture.address
    if @location.success
      @furniture.latitude = @location.lat
      @furniture.longitude = @location.lng
    end
    respond_to do |format|
      if @furniture.save
        format.html { redirect_to @furniture, notice: 'Furniture was successfully created.' }
        format.json { render :show, status: :created, location: @furniture }
      else
        format.html { render :new }
        format.json { render json: @furniture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /furnitures/1
  # PATCH/PUT /furnitures/1.json
  def update
    respond_to do |format|
      if @furniture.update(furniture_params)
        format.html { redirect_to @furniture, notice: 'Furniture Has Been Successfully Updated.' }
        format.json { render :show, status: :ok, location: @furniture }
      else
        format.html { render :edit }
        format.json { render json: @furniture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /furnitures/1
  # DELETE /furnitures/1.json
  def destroy
    @furniture.destroy
    respond_to do |format|
      format.html { redirect_to furnitures_url, notice: 'Furniture Has Been Successfully Deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_furniture
      @furniture = Furniture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def furniture_params
      params.require(:furniture).permit(:title, :tag, :picture1, :picture2, :picture3, :picture4, :price, :description, :email, :phone, :latitude, :longitude, :video, :oldness)
    end
end
