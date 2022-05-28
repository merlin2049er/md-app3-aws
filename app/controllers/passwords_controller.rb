# frozen_string_literal: true

# app/controllers/passwords_controller.rb
class PasswordsController < Devise::PasswordsController
    add_breadcrumb 'FORGOT'
end
