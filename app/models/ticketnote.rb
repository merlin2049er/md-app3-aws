# frozen_string_literal: true

class Ticketnote < ApplicationRecord
  belongs_to :troubleticket
  validates_presence_of :troubleticket_id
  validates_presence_of :notes

  def set_defaults
    self.admin ||= false
  end

end
