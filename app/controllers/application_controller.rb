# frozen_string_literal: true

class ApplicationController < ActionController::Base # For APIs, you may want to use :null_session instead. # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  helper_method :all_categories
  helper_method :all_products
  helper_method :all_notifications

  before_action :store_history
  before_action :set_search
  before_action :set_top_announcement
  before_action :banned

  rescue_from ActionController::InvalidAuthenticityToken,
              with: :handle_token_issues

  #rescue_from ActiveRecord::RecordNotFound, with: :errors_stop
  #rescue_from NoMethodError, with: :errors_stop
  #  rescue_from ActionDispatch::Cookies::CookieOverflow, with: :error_stop

  SITE_NAME = 'Tipping point'
  add_breadcrumb SITE_NAME, :root_path

  def errors_stop
    flash.now[:error] = 'Oops. Something went wrong.'
    redirect_to root_path
  end

  def handle_token_issues
    redirect_to(root_path) # redirect to page for handling this issue
  end

  def set_search
    @search = Product.published.search(params[:q])
  end

  def all_categories
    @categories = Category.all
    @categories = Category.order(:name)
  end

  def all_products
    @products = Product.all
  end

  def all_notifications
    @notifications =
      Notification.where('user_id =?', current_user.id).order('created_at DESC')
        .limit(10)
  end

  def show_errors
    add_breadcrumb 'Whoa!'
    render 'pages/error'
  end

  def banned
    if current_user && !Blacklist.find_by_email(current_user.email).nil?
      flash.now[:warning] = 'Sorry, you have been banned...'
      session.clear

      add_breadcrumb 'Banned'
      render 'pages/banned'
    end
  end

  def set_top_announcement
    @top_announcement = Announcement.limit(1).where('enabled =?', true).order(created_at: :desc).pluck(:announcement)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notifications
    @notifications = Notifications.find(params[:id])
  end

  def store_history
    session[:history] ||= []
    session[:history].delete_at(0) if session[:history].size >= 5
    #
  end

  # override before_timedout
  # not being used >>
  # def before_timedout
  # your custom code here
  # end
end
