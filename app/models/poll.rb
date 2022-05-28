class Poll < ApplicationRecord
  after_initialize :set_defaults
  has_many :poll_options,  dependent: :destroy
  has_many :voted,  dependent: :destroy

  validates_presence_of :name
  validates_presence_of :description

  accepts_nested_attributes_for :poll_options, reject_if: :all_blank, allow_destroy: true

  def set_defaults
    self.enabled ||= 'true'
  end

end
