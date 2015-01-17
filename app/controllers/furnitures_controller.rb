class FurnituresController < ApplicationController
  before_action :set_furniture, only: [:show, :edit, :update, :destroy]

  # GET /furnitures
  # GET /furnitures.json
  def index
    @furnitures = Furniture.all
    @currentLocation = [35, 140]
    @miles = 100
  end

  # GET /furnitures/1
  # GET /furnitures/1.json
  def show
  end

  # GET /furnitures/new
  def new
    @furniture = Furniture.new
  end

  # GET /furnitures/1/edit
  def edit
  end

  # POST /furnitures
  # POST /furnitures.json
  def create
    @furniture = Furniture.new(furniture_params)
    @furniture.user = current_user
    @furniture.address = current_user.address
    @furniture.phone = current_user.phone
    @furniture.email = current_user.email
    @location = Geokit::Geocoders::GoogleGeocoder.geocode "3131 Walnut Street, Philadelphia"
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
