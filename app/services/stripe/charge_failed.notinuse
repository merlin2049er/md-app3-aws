# app/services/stripe/charge_failed_handler.rb
# Stripe event handler for handling webhook
module Stripe
  # This will inherite the eventHandler main class
  class ChargeFailedHandler < EventHandler

    def handle_charge_failed(event)
      # your code goes here
      render json: {status: 200, message: 'booyah, not so good.'}
    end

  end
end
