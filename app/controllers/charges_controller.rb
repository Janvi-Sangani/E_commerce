class ChargesController < ApplicationController
  rescue_from Stripe::CardError, with: :catch_exception
  def new
  end

  def create
    binding.irb
    StripeChargesServices.new(charges_params, current_customer).call
    redirect_to my_orders_path
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken).merge(order_id: 3)
  end

  def catch_exception(exception)
    flash[:error] = exception.message
  end
end