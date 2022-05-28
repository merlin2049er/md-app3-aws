# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]
  include Pagy::Backend
  before_action :authenticate_user! # GET /transactions.json

  def index
    add_breadcrumb 'Transactions'

    if current_user.admin == true
      case params[:view]
      when 'shipped'
        add_breadcrumb '[Shipped]'

        @transactions =
          Transaction.where('shipped =? ', true).order(
            'created_at DESC'
          )
          @pagy, @transactions =
            pagy(
              Transaction.where('shipped =? ' ,true).order(
                'created_at DESC'
              )
            )
      when 'notshipped'
        add_breadcrumb '[Not Shipped]'

        @transactions =
          Transaction.where('shipped =?', false).order(
            'created_at DESC'
          )
          @pagy, @transactions =
            pagy(
              Transaction.where('shipped =? ', false).order(
                'created_at DESC'
              )
            )
      else
        @transactions = Transaction.all.order('created_at DESC')
        @pagy, @transactions = pagy(Transaction.all.order(  'created_at DESC'))
      end

  #    @transactions = Transaction.all.order('created_at DESC')
  #    @pagy, @transactions = pagy(Transaction.all.order(  'created_at DESC'))


    else

      case params[:view]
      when 'shipped'
        add_breadcrumb '[Shipped]'

        @transactions =
          Transaction.where('user_id =? AND shipped =?', current_user.id, true).order(
            'created_at DESC'
          )
          @pagy, @transactions =
            pagy(
              Transaction.where('user_id =?  AND shipped =?', current_user.id,true).order(
                'created_at DESC'
              )
            )
      when 'notshipped'
        add_breadcrumb '[Not Shipped]'

        @transactions =
          Transaction.where('user_id =? AND shipped =?', current_user.id, false).order(
            'created_at DESC'
          )
          @pagy, @transactions =
            pagy(
              Transaction.where('user_id =?  AND shipped =?', current_user.id,false).order(
                'created_at DESC'
              )
            )
      else
        @transactions =
          Transaction.where('user_id =?', current_user.id).order(
            'created_at DESC'
          )
        @pagy, @transactions =
          pagy(
            Transaction.where('user_id =?', current_user.id).order(
              'created_at DESC'
            )
          )
      end
    end

  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
        add_breadcrumb 'Transaction'
  end

  # GET /transactions/new
  def new
        add_breadcrumb 'New Transaction'
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
        add_breadcrumb 'Edit Transaction'
  end

  # POST /transactions
  # POST /transactions.json
  def create
        add_breadcrumb 'New Transaction'

    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html do
          redirect_to @transaction,
                      notice: 'Transaction was successfully created.'
        end
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new , status: :unprocessable_entity }
        format.json do
          render json: @transaction.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
        add_breadcrumb 'Edit Transaction'

    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html do
          redirect_to @transaction,
                      notice: 'Transaction was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit , status: :unprocessable_entity }
        format.json do
          render json: @transaction.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html do
        redirect_to transactions_url,
                    notice: 'Transaction was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(
      :transaction_msg,
      :user_id,
      :shipped,
      :invoice_number,
      :tracking_number,
      :postal_carrier,
      :receipt_url
    )
  end
end
