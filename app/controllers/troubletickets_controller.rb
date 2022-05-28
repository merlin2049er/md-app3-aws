# frozen_string_literal: true

class TroubleticketsController < ApplicationController
  before_action :set_troubleticket, only: %i[show edit update destroy]
  include Pagy::Backend
  before_action :authenticate_user!

  # GET /troubletickets
  # GET /troubletickets.json
  def index
        add_breadcrumb 'Trouble Ticket'

    if current_user.admin == true
      @troubletickets = Troubleticket.all
      @pagy, @troubletickets = pagy(Troubleticket.all.order(:created_at))
    else
      @troubletickets =
        Troubleticket.where('user_id =?', current_user.id).order(
          'created_at DESC'
        )
      @pagy, @troubletickets =
        pagy(
          Troubleticket.where('user_id =?', current_user.id).order(
            'created_at DESC'
          )
        )
    end
  end

  # GET /troubletickets/1
  # GET /troubletickets/1.json
  def show
        add_breadcrumb 'Trouble Ticket'
  end

  # GET /troubletickets/new
  def new
        add_breadcrumb 'New Trouble Ticket'

    @troubleticket = Troubleticket.new
    @troubleticket.ticketnotes.build
  end

  # GET /troubletickets/1/edit
  def edit
        add_breadcrumb 'Update Trouble Ticket'
  end

  # POST /troubletickets
  # POST /troubletickets.json
  def create
        add_breadcrumb 'New Trouble Ticket'

    @troubleticket = Troubleticket.new(troubleticket_params)

    respond_to do |format|
      if @troubleticket.save
        format.html do
          redirect_to @troubleticket,
                      notice: 'Trouble ticket was successfully created.'
        end
        format.json { render :show, status: :created, location: @troubleticket }
      else
        format.html { render :new , status: :unprocessable_entity }
        format.json do
          render json: @troubleticket.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /troubletickets/1
  # PATCH/PUT /troubletickets/1.json
  def update
        add_breadcrumb 'Update Trouble Ticket'

    respond_to do |format|
      if @troubleticket.update(troubleticket_params)
        format.html do
          redirect_to @troubleticket,
                      notice: 'Trouble ticket was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @troubleticket }
      else
        format.html { render :edit , status: :unprocessable_entity }
        format.json do
          render json: @troubleticket.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /troubletickets/1
  # DELETE /troubletickets/1.json
  def destroy
    @troubleticket.destroy
    respond_to do |format|
      format.html do
        redirect_to troubletickets_url,
                    notice: 'Trouble ticket was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  def close
    @troubleticket = Troubleticket.find(params[:id])
    @troubleticket.status = 'false'

    respond_to do |format|
      if @troubleticket.save
        #  fix this it reload index

        format.html do
          redirect_to @troubleticket,
                      notice: 'Trouble ticket was successfully closed.'
        end
        format.json { render :show, status: :created, location: @troubleticket }

      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_troubleticket
    @troubleticket = Troubleticket.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def troubleticket_params
    params.require(:troubleticket).permit(
      :user_id,
      :status,
      :campaign,
      :subject,
      :message
    )
  end # close ticket
end
