class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def my_orders
    @orders = current_customer.orders
  end

  def order_detail
    if params[:address_id].present?
      binding.irb
      @address = Address.find_by(id: params["address_id"])
      @cart_items = current_customer.cart_items
      @total_amount = calculate_price
    else
      @addresses = current_customer.addresses
      flash[:messages] = "Please select any one address"
      redirect_to place_orders_path
    end
  end

  def place_order
    @addresses = current_customer.addresses
    @total_amount = calculate_price
  end

  def create_order
    binding.irb
    if params[:address_id].present?
      @total_amount = calculate_price
      order = Order.new(address_id: params[:address_id], customer_id: current_customer.id, total: @total_amount, status: "placed")
      order.save!
      OrderMailer.with(order: current_customer.email).order_placed.deliver_now
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        OrderItem.create!(product_id: cart_item.product_id, order_id: order.id, quantity: cart_item.quantity, price: cart_item.price, status: "placed")
        product_quantity = Product.find_by(id: cart_item.product_id)
        product_quantity.update(quantity: product_quantity.quantity - cart_item.quantity)
        cart_item.destroy
      end
      redirect_to my_orders_path
    else
      redirect_to homes_path
    end
  end

  private 

  def calculate_price
    @cart_items = current_customer.cart_items
    @cart_items.sum(:price)
  end
end
