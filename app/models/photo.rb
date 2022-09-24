# frozen_string_literal: true

class Photo < ActiveRecord::Base
  belongs_to :product
  has_one_attached :file
#, service: :s3

  after_initialize :set_defaults

#  validates_presence_of :uri
#  validates_presence_of :file

  def set_defaults
    self.enabled ||= true
#   self.uri ||= 'https://res.cloudinary.com/dlfodsgbd/image/upload/v1590070578/TippingPoint/photo_not_available.png'
  end
end
