class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[edit destroy update show]
  before_action :authenticate_customer!

  def index
    @order_items = OrderItem.all
  end

  def show
    @order_item
  end

  def fetch_order_items
    @order_items = OrderItem.where(order_id: params[:order_id])
  end

  private
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end
end