class Vendor < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :vendor
  validates_presence_of :contact_name
  validates_presence_of :address1
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :country
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :email, uniqueness: { case_sensitive: false }
  validates_presence_of :phone
  validates_presence_of :website
  validates_presence_of :product
  validates_presence_of :dropship
  validates_presence_of :processing
  validates_presence_of :locally
  validates_presence_of :payments
  validates_presence_of :courier

  validates_numericality_of :processing, greater_than: 0
  validates_numericality_of :processing, less_than: 5

  validates_length_of :product, minimum: 35

end
