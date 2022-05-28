# frozen_string_literal: true

class NewslettersController < ApplicationController

  include Pagy::Backend
  before_action :authenticate_user!

  def index
    add_breadcrumb 'newsletter list'
    @newsletter_lists = User.where({ newsletter: "true"})
    @pagy, @todo_lists = pagy(User.where({ newsletter: "true"}).order(:created_at))

  end


end
