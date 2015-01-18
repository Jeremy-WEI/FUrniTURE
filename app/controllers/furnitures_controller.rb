class FurnituresController < ApplicationController
  before_action :set_furniture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]
  # GET /furnitures
  # GET /furnitures.json
  def index
    @furnitures = Furniture.all
    @currentLocation = [23, 170]
    @miles = 100
  end

  def search
    tag = params[:tag]
    address = params[:address]
    price = params[:price]
    @miles = params[:miles]
    tmp = Geokit::Geocoders::GoogleGeocoder.geocode(address)
    @currentLocation = [tmp.lat, tmp.lng]
    furnitureAll = Furniture.all
    @furnitures = []
    furnitureAll.each do |f|
      location = Geokit::LatLng.new(f.latitude, f.longitude)
      if f.tag == tag and f.price.to_i <= price.to_i and f.price.to_i >= (price.to_i-50) and location.distance_to(@currentLocation) <= @miles.to_i and location.distance_to(@currentLocation) >= (@miles.to_i - 50)
        @furnitures.append(f)
      end
    end
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

  def addfurniture
    current_user.watchlist
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
        format.html { redirect_to @furniture, notice: 'Furniture was successfully updated.' }
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
      format.html { redirect_to furnitures_url, notice: 'Furniture was successfully destroyed.' }
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
      params.require(:furniture).permit(:title, :tag, :picture1, :picture2, :picture3, :picture4, :price, :description, :email, :phone, :latitude, :longitude)
    end
end
