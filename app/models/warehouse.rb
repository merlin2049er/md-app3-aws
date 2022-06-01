class Warehouse < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :address1
  validates_presence_of :city
  validates_presence_of :prov
  validates_presence_of :postalcode
  validates_presence_of :country

end
