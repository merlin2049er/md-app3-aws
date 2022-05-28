# app/services/stripe/checkout_session_completed_handler.rb
# Stripe event handler for handling webhook
module Stripe
  # This will inherite the eventHandler main class
  class CheckoutSessionCompletedHandler < EventHandler

    def handle_checkout_session_completed(event)
      # your code goes here
      render json: {message: 'booyah, great.'}
    end

  end
end
