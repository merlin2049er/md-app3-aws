# frozen_string_literal: true

# Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  Stripe.api_key = Rails.application.credentials[:STRIPE_SECRET_KEY]


# StripeEvent.signing_secret = ENV['STRIPE_SIGNING_SECRET'] # StripeEvent.signing_secret = Rails.application.credentials.stripe[Rails.env.to_sym][:signing_secret]
  StripeEvent.signing_secret = Rails.application.credentials[:STRIPE_SIGNING_SECRET]

StripeEvent.configure do |events|
  # events.subscribe 'charge.dispute.created', Stripe::EventHandler.new
  events.subscribe 'checkout.session.completed', Stripe::EventHandler.new
  events.subscribe 'charge.failed', Stripe::EventHandler.new
end
