class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]
  include Pagy::Backend
  # GET /vendors
  # GET /vendors.json
  def index
        add_breadcrumb 'Vendors'
    @vendors = Vendor.all
    @pagy, @vendors = pagy(Vendor.all.order(:created_at))
  end

  # GET /vendors/1
  # GET /vendors/1.json
  def show
    add_breadcrumb 'Vendor'
  end

  # GET /vendors/new
  def new
      add_breadcrumb 'New Vendor'
    @vendor = Vendor.new
  end

  # GET /vendors/1/edit
  def edit
    add_breadcrumb 'Edit Vendor'
  end

  # POST /vendors
  # POST /vendors.json
  def create
    add_breadcrumb 'New Vendor'
    @vendor = Vendor.new(vendor_params)

    respond_to do |format|
     #if verify_recaptcha(model: @vendor) && @vendor.save  -- doesn't like verify verify_recaptcha
     captcha_message = "You are a robot, failed!"
    if verify_recaptcha(model: @vendor, message: captcha_message) && @vendor.save
       #if  @vendor.save
        format.html { redirect_to pages_thankyou_path, notice: 'Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1
  # PATCH/PUT /vendors/1.json
  def update
    add_breadcrumb 'Vendor'
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit , status: :unprocessable_entity}
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_url, notice: 'Vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vendor_params
      params.require(:vendor).permit(:vendor, :contact_name, :address1, :address2, :city, :state, :country, :email, :phone, :website, :product, :dropship, :processing, :locally, :payments, :courier)
    end
end
