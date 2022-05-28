# frozen_string_literal: true

class Blacklist < ApplicationRecord
  validates :email, uniqueness: { case_sensitive: false }
  validates_presence_of :email
end
