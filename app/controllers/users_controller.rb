# frozen_string_literal: true

class UsersController < Devise::ConfirmationsController
  include Pagy::Backend

  before_action :authenticate_user!

  def index
    add_breadcrumb 'Users'
    @total = User.count
    @pagy, @users = pagy(User.all)
  end

end
