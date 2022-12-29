class ChargesController < ApplicationController
  rescue_from Stripe::CardError, with: :catch_exception
  def new
  end

  def create
    if params[:address_id].present?
      StripeChargesServices.new(charges_params, current_customer).call
      redirect_to details_orders_path(address_id: params[:address_id])
    end
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken, :order_id)
  end

  def catch_exception(exception)
    flash[:error] = exception.message
  end
end