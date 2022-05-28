# frozen_string_literal: true

class NotificationsController < ApplicationController
  include Pagy::Backend

  before_action :set_notification, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /notifications
  # GET /notifications.json
  def index
    add_breadcrumb 'Notifications'

    @notifications =
      Notification.where('user_id =?', current_user.id).order('created_at DESC')
    @pagy, @notifications = pagy(@notifications)
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
    add_breadcrumb 'Notification'
  end

  # GET /notifications/new
  def new
    add_breadcrumb 'New Notification'
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
    add_breadcrumb 'Edit Notification'
  end

  # POST /notifications
  # POST /notifications.json
  def create
    add_breadcrumb 'New Notification'
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html do
          redirect_to @notification,
                      notice: 'Notification was successfully created.'
        end
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new , status: :unprocessable_entity }
        format.json do
          render json: @notification.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
        add_breadcrumb 'Edit Notification'

    respond_to do |format|
      if @notification.update(notification_params)
        format.html do
          redirect_to @notification,
                      notice: 'Notification was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit , status: :unprocessable_entity }
        format.json do
          render json: @notification.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html do
        redirect_to notifications_url,
                    notice: 'Notification was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notification
    @notification = Notification.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def notification_params
    params.require(:notification).permit(:notify_msg, :enabled, :user_id)
  end
end
