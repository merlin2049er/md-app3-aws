# frozen_string_literal: true

require 'stripe'

# Rails.configuration.stripe = {
#    :publishable_key => "pk_test_wNeuri3HuwlL2HgmMLaCfLxb00noMQ7VJG",
#    :secret_key      => "sk_test_GTNsI2Uc5BBqqWiHas7hYJlt00ruRDdxlo"
# }

# Stripe.api_key = Rails.configuration.stripe[:secret_key]

#  --> uae this instead of above before going live
Rails.configuration.stripe = {
 #  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    publishable_key:  Rails.application.credentials[:STRIPE_PUBLISHABLE_KEY],

 #  secret_key: ENV['STRIPE_SECRET_KEY']
    secret_key: Rails.application.credentials[:STRIPE_SECRET_KEY]
}

 Stripe.api_key = Rails.configuration.stripe[:secret_key]
#  Stripe.api_key = Rails.application.credentials[:STRIPE_SECRET_KEY]  # not sure if i need to replace this #

