# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  add_breadcrumb 'Sign up'

  def edit
    add_breadcrumb 'profile'
  end

  private

  def sign_up_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :username,
      :firstname,
      :lastname,
      :address1,
      :address2,
      :city,
      :state,
      :postal,
      :country,
      :newsletter
    )
  end

  def account_update_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :username,
      :firstname,
      :lastname,
      :address1,
      :address2,
      :city,
      :state,
      :postal,
      :country,
      :newsletter
    )
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
