# frozen_string_literal: true

class ProductsController < ApplicationController
  include Pagy::Backend

  before_action :set_product, only: %i[show edit update destroy]

  # GET /products
  # GET /products.json
  def index
    add_breadcrumb 'products'
    @q = params[:query]
    @search = Product.published.search(params[:query])
    @total_products = Product.published.count
    require 'time'

    todaydate = Time.new

    todaydate = "#{todaydate.year}-#{todaydate.month}-#{todaydate.day}"
    #todaydate = Date.today

    unless params[:query].blank?
      @search =
        @search.records.where(
        #  'draft = ? and active = ? and funded = ? and startdate < ? and enddate > ?',
           'draft = ? and active = ? and funded = ? and ? BETWEEN startdate AND enddate',
          false,
          true,
          false,
          todaydate

        )
    end

    # save search keyword to search for table
    sk = SearchFor.new
    sk.searchterm = @q.to_s
    sk.save

    @searchtotal = @search.count
    @products = @search
    @pagy, @a =
      Pagy.new(
        count: @products.count, page: params[:page].blank? ? 1 : params[:page]
      )
    @products = @products[@pagy.offset, @pagy.items]
  end

  def show

    # this doesn't work either - i need to keep the array in tact
    if session[:history].exclude?(request.original_url)
        session[:history] << request.original_url
    end

    add_breadcrumb 'products',  :products_path
    add_breadcrumb @product.title

    @product = Product.friendly.find(params[:id])
    # insert comments here...
    commontator_thread_show(@product)
    impressionist(@product)

    @photo = @product.photos.where('enabled' => true)
    @taken = Cart.where('product_id' => @product).sum(:qty)
    @remaining = @product.qty - @taken

    if @remaining == 1
      flash.now[:warning] =
        'This is the last remaining product required to complete the group order.  By adding it to your cart, it will complete the order for the campaign.'
    end

    if @remaining.zero?
      flash.now[:warning] = 'All gone!'

      @product.funded = 'true'
      @product.save!
      cart = Cart.where(product_id: @product.id).update_all(processing: true)

      respond_to do |format|
        format.html do
          redirect_to root_path, notice: 'Product was successfully funded.'
        end
        format.json { render :show, status: :created, location: @product }
      end

      # find all users in this successful campaign
      user_id = Cart.where(product_id: @product.id).pluck('DISTINCT(user_id)')
      user_id.each do |id|
        @user = User.find_by_id(id)
        SuccessfulCampaignMailer.successful_campaign_email(@user).deliver_later
      end
    end
  end

  # GET /products/new
  def new
        add_breadcrumb 'New product'
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
        add_breadcrumb 'Edit product'
  end

  # POST /products
  # POST /products.json
  def create
        add_breadcrumb 'New product'

    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html do
          redirect_to @product, notice: 'Product was successfully created.'
        end
        format.json { render :show, status: :created, location: @product }
      else
        puts @product.errors.messages
        format.html { render :new , status: :unprocessable_entity }
        format.json do
          render json: @product.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html do
          redirect_to @product, notice: 'Product was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit , status: :unprocessable_entity }
        format.json do
          render json: @product.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html do
        redirect_to products_url, notice: 'Product was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  def add_to_cart
    already = Cart.where(user_id: current_user.id, product_id: params[:id]).last

    if already.blank?
      @cart =
        Cart.new(
          user_id: current_user.id, product_id: params[:id], qty: params[:qty]
        )

      respond_to do |format|
        if @cart.save
          format.html do
            redirect_back fallback_location: root_path,
                          notice: 'Product was successfully added to cart.'
          end
          format.json { render :show, status: :created, location: @cart }
        else
          format.html { render :new , status: :unprocessable_entity }
          format.json do
            render json: @cart.errors, status: :unprocessable_entity
          end
        end
      end
    elsif already.paid == true
      @cart =
        Cart.new(
          user_id: current_user.id, product_id: params[:id], qty: params[:qty]
        )

      respond_to do |format|
        if @cart.save
          format.html do
            redirect_back fallback_location: root_path,
                          notice: 'Product was successfully added to cart.'
          end
          format.json { render :show, status: :created, location: @cart }
        else
          format.html { render :new , status: :unprocessable_entity }
          format.json do
            render json: @cart.errors, status: :unprocessable_entity
          end
        end
      end
    else
      @cart = Cart.find_by(user_id: current_user.id, product_id: params[:id])
      @cart.qty += params[:qty].to_i

      respond_to do |format|
        if @cart.save
          format.html do
            redirect_back fallback_location: root_path,
                          notice: 'Product was successfully updated in cart.'
          end
          format.json do
            render json: @cart.errors, status: :unprocessable_entity
          end
        else
          format.html { render :new , status: :unprocessable_entity }
          format.json do
            render json: @cart.errors, status: :unprocessable_entity
          end
        end
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.friendly.find(params[:id])

    # @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(
      :title,
      :picurl,
      :template,
      :body,
      :price,
      :msrp,
      :startdate,
      :enddate,
      :draft,
      :active,
      :category_id,
      :qty,
      :length,
      :width,
      :height,
      :weight,
      :courier,
      :courierurl,
      :brand,
      photos_attributes: %i[product_id uri done _destroy]
    )
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.require(:cart).permit(:user_id, :product_id, :qty)
  end # params.fetch(:cart, {})
end
