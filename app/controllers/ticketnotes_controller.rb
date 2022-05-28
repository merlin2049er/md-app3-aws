# frozen_string_literal: true

class TicketnotesController < ApplicationController
  include Pagy::Backend
  before_action :set_ticketnotes, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /ticketnotes
  # GET /ticketnotes.json
  def index
    add_breadcrumb 'Ticket notes'
    @ticketnotes = Ticketnote.all
    @ticketnotes = Ticketnote.count
    @pagy, @ticketnotes = pagy(Ticketnote.all.order(:created_at))
  end

  # GET /ticketnotes/1
  # GET /ticketnotes/1.json
  def show
        add_breadcrumb 'Ticket notes'
  end

  # GET /ticketnotes/new
  def new
        add_breadcrumb 'New Ticket notes'

    @ticketnote = Ticketnote.new(troubleticket_id: params[:troubleticket_id])
    @troubleticket = Troubleticket.find_by_id(params[:troubleticket_id])
  end

  # GET /ticketnotes/1/edit
  def edit
        add_breadcrumb 'Edit Ticket notes'
  end

  # POST /ticketnotes
  # POST /ticketnotes.json
  def create
        add_breadcrumb 'New Ticket notes'

    @ticketnote = Ticketnote.new(ticketnote_params)
    @ticketnote.troubleticket_id = params[:troubleticket_id]

    if current_user.admin?
      @ticketnote.admin = true
    else
      @ticketnote.admin = false
    end

    respond_to do |format|
      if @ticketnote.save
        format.html do
          redirect_to troubleticket_path(:id => @ticketnote.troubleticket_id), notice: 'Ticket note was successfully created.'
        end
        format.json { render :show, status: :created, location: @ticketnote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @ticketnote.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /ticketnotes/1
  # PATCH/PUT /ticketnotes/1.json
  def update
        add_breadcrumb 'Edit Ticketnotes'

    respond_to do |format|
      if @ticketnote.update(ticketnote_params)
        format.html do
          redirect_to @ticketnote,
                      notice: 'Ticket note was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @ticketnote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @ticketnote.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /ticketnotes/1
  # DELETE /ticketnotes/1.json
  def destroy
    @ticketnote.destroy
    respond_to do |format|
      format.html do
        redirect_to @ticketnote,
                    notice: 'Ticket note was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticketnotes
    @ticketnote = Ticketnote.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ticketnote_params
    params.require(:ticketnote).permit(:notes, :troubleticket_id, :admin)
  end
end
