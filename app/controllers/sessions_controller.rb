# frozen_string_literal: true

# app/controllers/passwords_controller.rb
class SessionsController < Devise::SessionsController
    add_breadcrumb 'LOG IN'
end
