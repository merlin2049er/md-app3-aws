# frozen_string_literal: true

class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :products

  after_initialize :set_defaults

  def set_defaults
    self.paid ||= 'false'
  end
end
