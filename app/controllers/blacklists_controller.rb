# frozen_string_literal: true

class BlacklistsController < ApplicationController
  before_action :set_blacklist, only: %i[show edit update destroy]
  include Pagy::Backend
  before_action :authenticate_user! # GET /blacklists.json



  def index

    add_breadcrumb 'Blacklist'

    @blacklist = Blacklist.all
    @blacklist = Blacklist.count

    @pagy, @blacklist = pagy(Blacklist.all.order(:email))
  end

  # GET /blacklists/1
  # GET /blacklists/1.json
  def show
    add_breadcrumb 'Blacklist'
  end

  # GET /blacklists/new
  def new
    add_breadcrumb 'New Blacklist'
    @blacklist = Blacklist.new
  end

  # GET /blacklists/1/edit
  def edit
        add_breadcrumb 'Edit Blacklist'
  end

  # POST /blacklists
  # POST /blacklists.json
  def create
        add_breadcrumb 'New Blacklist'

    @blacklist = Blacklist.new(blacklist_params)

    respond_to do |format|
      if @blacklist.save
        format.html do
          redirect_to @blacklist, notice: 'Blacklist was successfully created.'
        end
        format.json { render :show, status: :created, location: @blacklist }
      else
        format.html { render :new , status: :unprocessable_entity }
        format.json do
          render json: @blacklist.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /blacklists/1
  # PATCH/PUT /blacklists/1.json
  def update
        add_breadcrumb 'New Blacklist'

    respond_to do |format|
      if @blacklist.update(blacklist_params)
        format.html do
          redirect_to @blacklist, notice: 'Blacklist was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @blacklist }
      else
        format.html { render :edit, status: :unprocessable_entity}
        format.json do
          render json: @blacklist.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /blacklists/1
  # DELETE /blacklists/1.json
  def destroy
    @blacklist.destroy
    respond_to do |format|
      format.html do
        redirect_to blacklists_url,
                    notice: 'Blacklist was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blacklist
    @blacklist = Blacklist.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def blacklist_params
    params.require(:blacklist).permit(:email, :comment)
  end
end
