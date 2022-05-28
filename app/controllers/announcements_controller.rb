class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: %i[ show edit update destroy ]
  include Pagy::Backend
  before_action :authenticate_user!
  # GET /announcements or /announcements.json

  def index
    add_breadcrumb 'Announcement'
    @announcement = Announcement.all
    #@announcement = Announcement.count
    @pagy, @announcement = pagy(Announcement.all.order(:created_at))
  end

  # GET /announcements/1 or /announcements/1.json
  def show
      add_breadcrumb 'Announcement'
  end

  # GET /announcements/new
  def new
      add_breadcrumb 'New Announcement'
    @announcement = Announcement.new
  end

  # GET /announcements/1/edit
  def edit
    add_breadcrumb 'Edit Announcement'
  end

  # POST /announcements or /announcements.json
  def create
      add_breadcrumb 'New Announcement'
    @announcement = Announcement.new(announcement_params)

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: "Announcement was successfully created." }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1 or /announcements/1.json
  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to @announcement, notice: "Announcement was successfully updated." }
        format.json { render :show, status: :ok, location: @announcement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1 or /announcements/1.json
  def destroy
    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to announcements_url, notice: "Announcement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def announcement_params
      params.require(:announcement).permit(:announcement, :enabled)
    end
end
