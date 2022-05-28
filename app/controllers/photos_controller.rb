# frozen_string_literal: true

class PhotosController < ApplicationController
  include Pagy::Backend
  before_action :set_photo, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /photos
  # GET /photos.json
  def index
    add_breadcrumb 'Photos'
    @photos = Photo.all
    @total = Photo.count
    @pagy, @photos = pagy(Photo.all)
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    add_breadcrumb 'Photos'
  end

  # GET /photos/new
  def new
    add_breadcrumb 'New Photo'
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
        add_breadcrumb 'Photos'
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    add_breadcrumb 'New Photo'

    respond_to do |format|
      if @photo.save
        format.html do
          redirect_to @photo, notice: 'Photo was successfully created.'
        end
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new , status: :unprocessable_entity }
        format.json do
          render json: @photo.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
        add_breadcrumb 'Edit Photo'

    respond_to do |format|
      if @photo.update(photo_params)
        format.html do
          redirect_to @photo, notice: 'Photo was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit , status: :unprocessable_entity }
        format.json do
          render json: @photo.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html do
        redirect_to photos_url, notice: 'Photo was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def photo_params
    params.require(:photo).permit(:uri, :enabled, :product_id)
  end
end
