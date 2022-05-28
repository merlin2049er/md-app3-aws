# frozen_string_literal: true

class CartsController < ApplicationController
  include Pagy::Backend

  before_action :set_cart, only: %i[create destroy]
  before_action :authenticate_user!

  # GET /article/ns
  # GET /articles.json
  def index
    add_breadcrumb 'shopping cart'
    @grand_sub_total = 0
    @grand_tax_total = 0
    @grand_total = 0
    @total_qty = 0

    case params[:view]
    when 'paid'
      add_breadcrumb '[Paid]'
      @carts = Cart.where('user_id =? AND paid =?', current_user.id, true)
    when 'notpaid'
      add_breadcrumb '[Not Paid]'
      @carts = Cart.where('user_id =? AND paid =?', current_user.id, false)
    else
      @carts = Cart.where('user_id =?', current_user.id)
    end

    @pagy, @carts = pagy(@carts)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    add_breadcrumb 'shopping cart'
  end

  # GET /articles/new
  def new
    add_breadcrumb 'New shopping cart'
    @cart = Cart.new
  end

  # GET /articles/1/edit
  def edit
    add_breadcrumb 'edit shopping cart'
  end

  def create
    add_breadcrumb 'new shopping cart'

    @cart = Cart.new

    respond_to do |format|
      if @cart.save(carts_params)
        format.html do
          redirect_to @carts, notice: 'Product has been added to cart.'
        end
        format.json { render :show, status: :created, location: @carts_path }
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json do
          render json: @carts.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    add_breadcrumb 'Edit shopping cart'

    @cart = Cart.find(params[:id])
    @cart.update!(qty: params[:qty])
    redirect_to carts_path
  end

  def destroy
    @cart.destroy
    respond_to do |format|
      format.html do
        redirect_to carts_url,
                    notice: 'Item in cart was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def carts_params
    params.require(:cart).permit(:qty)
  end # added qty
end
