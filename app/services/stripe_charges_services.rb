class StripeChargesServices
  attr_accessor :customer, :stripe_email, :stripe_token, :order_id
  
  def initialize(params, customer)
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @order_id = params[:order_id] 
    @customer = customer
  end

  def call
    create_charge(find_customer)
  end

  private

  def find_customer
    if @customer.stripe_customer_id.present?
      retrieve_customer(@customer.stripe_customer_id)
    else
      create_customer
    end
  end

  def retrieve_customer(stripe_token)
    Stripe::Customer.retrieve(stripe_token) 
  end

  def create_customer
    customer = Stripe::Customer.create(
      email: stripe_email,
      source: stripe_token
    )
    @customer.update(stripe_customer_id: customer.id)
    customer
  end

  def create_charge(customer)
    stripe_payment = Stripe::PaymentIntent.create(
      customer: customer.id,
      amount: calculate_price,
      description: customer.email,
      currency: "usd"
    )
    Payment.create(customer_id: @customer.id, amount: calculate_price, payment_method: "card", stripe_payment_id: stripe_payment.id)
  end

  # def order_amount
  #   Order.find_by(id: order_id).total.to_i
  # end

  def calculate_price
    @cart_items = @customer.cart_items
    @cart_items.sum(:price).to_i
  end
end