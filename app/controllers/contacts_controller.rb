# frozen_string_literal: true

class ContactsController < ApplicationController # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact =  Contact.new(contact_params)
    captcha_message = "You are a robot, failed!"

    if verify_recaptcha(model: @contact, message: captcha_message) && @contact.save
    #if @contact.save

      redirect_to pages_thankyou_path
      name = params[:contact][:name]
      email = params[:contact][:email]
      message = params[:contact][:message]
      supplier = params[:contact][:supplier]
      registered_user = params[:contact][:registered_user]

      ContactMailer.contact_email(
        name,
        email,
        message,
        supplier,
        registered_user
      ).deliver

    else

       render pages_contact_path, status: :unprocessable_entity
    # redirect_to pages_contact_path

    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(
      :name,
      :email,
      :message,
      :registered_user,
      :supplier
    )
  end
end
