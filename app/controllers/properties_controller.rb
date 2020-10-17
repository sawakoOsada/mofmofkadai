class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def show
    @stations = @property.stations
  end

  def new
    @property = Property.new
    2.times { @property.stations.build }
  end

  def edit
    @property.stations.build
  end

  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(update_property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(
        :name,
        :price,
        :address,
        :years,
        :etc,
        stations_attributes: [:route_name,
                              :station_name,
                              :minutes]
      )
    end

    def update_property_params
      params.require(:property).permit(
        :name,
        :price,
        :address,
        :years,
        :etc,
        stations_attributes: [:route_name,
                              :station_name,
                              :minutes,
                              :_destroy,
                              :id]
      )
    end
end
