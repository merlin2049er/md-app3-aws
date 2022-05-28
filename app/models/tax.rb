# frozen_string_literal: true

class Tax < ApplicationRecord
  validates_presence_of :prov_id
  validates :prov_id, uniqueness: { case_sensitive: false }
  validates_presence_of :tax_rate

  after_initialize :set_defaults

  def set_defaults
    self.enabled ||= 'true'
  end
end
