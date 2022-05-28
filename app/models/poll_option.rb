class PollOption < ApplicationRecord
  #belongs_to :poll
  after_initialize :set_defaults
  validates_presence_of :poll
  validates_presence_of :poll_url

  #default_scope { order(count: :desc) }


  def set_defaults
    self.enabled ||= 'true'
    self.poll_url ||=
      'https://res.cloudinary.com/dlfodsgbd/image/upload/v1590070578/TippingPoint/photo_not_available.png'
    self.poll_url_enabled ||= 'true'
  end

end
