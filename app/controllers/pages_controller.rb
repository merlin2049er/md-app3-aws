# frozen_string_literal: true

class PagesController < ApplicationController
  include Pagy::Backend

  def about
    add_breadcrumb 'About'
  end

  def admin
    add_breadcrumb 'Admin page'
  end

  def analytics
    add_breadcrumb 'Analytics Page'
  end

  def cookies
    add_breadcrumb 'Cookies'
  end

  def carousel
    add_breadcrumb 'carousel'
  end

  def thankyou
    add_breadcrumb 'Thank you'
  end

  def contact
    add_breadcrumb 'Contact'
    @contact = Contact.new
  end

  def dashboard
    add_breadcrumb 'Dashboard'

    # user model queries
    @superuser = User.where('admin' => true)

    @toptenlogin = User.limit(10).order('sign_in_count DESC')

    @lasttenlogin = User.limit(10).order('last_sign_in_at DESC')

    # products model queries

    @toptenending = Product.limit(10).order('enddate DESC')
    @toptenproductsstarted = Product.limit(10).order('startdate ASC')

    @toptenpricy = Product.limit(10).order('Price DESC')
    @toptencheap = Product.limit(10).order('Price ASC')

    @cartcount = Cart.count
    @draftcount = Product.where('draft' => true).count

    @successfully = Product.where('funded' => true).count
    @unsuccessfully = Product.where('funded' => false).count

    @unconfirmeduser = User.where('confirmed_at =?', nil).count
    @registeredusers = User.count

    @totalnotifications = Notification.count
    @totaltransactions = Transaction.count
  end

  def error
    add_breadcrumb 'Error'
  end


  def index
    add_breadcrumb 'Home'

    # check for filled in profile
    if current_user && !current_user.is_profile_complete &&
         Blacklist.find_by_email(current_user.email).nil?
      flash.now[:warning] = 'Please, fill in your profile...'
    end

    @recent_products = Product.published.most_recent(6)

  end

  def index2
    add_breadcrumb 'Home'

    # check for filled in profile
    if current_user && !current_user.is_profile_complete &&
         Blacklist.find_by_email(current_user.email).nil?
      flash.now[:warning] = 'Please, fill in your profile...'
    end

    @last_chance = Product.published.ending_soonest(6)
  end

  def index3
    add_breadcrumb 'Home'

    # check for filled in profile
    if current_user && !current_user.is_profile_complete &&
         Blacklist.find_by_email(current_user.email).nil?
      flash.now[:warning] = 'Please, fill in your profile...'
    end

    @expired = Product.published.ending_soonest(6)  #fix this to expired
  end


  def invite
        add_breadcrumb 'Invite'

    @invite = Invite.new
    @message =
      'Hi, please check out this awesome site and get in on the savings.'
  end

  def jobs
    add_breadcrumb 'Jobs'
  end

  def payments
    add_breadcrumb 'Payments'
  end

  def privacy
    add_breadcrumb 'Privacy'
  end

  def random
    add_breadcrumb 'Random'
    @random = Product.published.limit(12).order('RANDOM()')
  end

  def random2
    add_breadcrumb 'Random'
    @random = Product.published.limit(12).order('RANDOM()')
  end

  def terms
    add_breadcrumb 'Terms'
  end

  def shipping
    add_breadcrumb 'Shipping'
  end

  def returns
    add_breadcrumb 'Returns'
  end

  def taxes
    add_breadcrumb 'Taxes'
  end

  #def download_pdf
  # send_file "#{Rails.root}/app/assets/docs/JG Resume ROR.pdf", type: "application/pdf", x_sendfile: true
  #end

end
