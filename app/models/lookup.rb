# frozen_string_literal: true

class Lookup
  def self.getrate(user)
    taxrate = Tax.find_by_prov_id(user.state)

    if taxrate.nil?
      tax_rate = 0.0
    else
      taxrate.tax_rate
    end
  end
end
