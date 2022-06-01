class WarehousesController < ApplicationController
  before_action :set_warehouse, only: %i[ show edit update destroy ]
  include Pagy::Backend

  # GET /warehouses or /warehouses.json
  def index
    add_breadcrumb 'Warehouses'
    @warehouses = Warehouse.all
    @pagy, @warehouses = pagy(Warehouse.all.order(:created_at))

  end

  # GET /warehouses/1 or /warehouses/1.json
  def show
    add_breadcrumb 'Warehouse'
  end

  # GET /warehouses/new
  def new
    add_breadcrumb 'Warehouse'
    @warehouse = Warehouse.new
  end

  # GET /warehouses/1/edit
  def edit
    add_breadcrumb 'Edit Warehouse'
  end

  # POST /warehouses or /warehouses.json
  def create
    add_breadcrumb 'New Warehouse'

    @warehouse = Warehouse.new(warehouse_params)

    respond_to do |format|
      if @warehouse.save
        format.html { redirect_to warehouse_url(@warehouse), notice: "Warehouse was successfully created." }
        format.json { render :show, status: :created, location: @warehouse }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warehouses/1 or /warehouses/1.json
  def update
    add_breadcrumb 'Warehouse'

    respond_to do |format|
      if @warehouse.update(warehouse_params)
        format.html { redirect_to warehouse_url(@warehouse), notice: "Warehouse was successfully updated." }
        format.json { render :show, status: :ok, location: @warehouse }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warehouses/1 or /warehouses/1.json
  def destroy

    @warehouse.destroy

    respond_to do |format|
      format.html { redirect_to warehouses_url, notice: "Warehouse was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def warehouse_params
      params.require(:warehouse).permit(:name, :address1, :address2, :city, :prov, :postalcode, :country)
    end
end
