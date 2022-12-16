module Admin
  class OrderItemsController < ApplicationController
    before_action :set_order_item, only: %i[edit destroy update show]
    before_action :authenticate_user!

    def index
      @order_items = OrderItem.joins(product: :user).where("users.id =?", current_user)
    end 

    def edit 
      @order_item
    end

    def update
      @order = Order.find(@order_item.order_id)
      if @order_item.present?
        @order_item.update(order_item_params)
        @order_item_status = @order.order_items.pluck(:status).uniq
        if @order_item_status == ["delivered"]
          @order.update(status: "delivered")
          OrderMailer.with(order: @order.customer.email).order_delivered.deliver_now
          redirect_to admin_orders_path
        end
      else
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end

    def fetch_order_items
      @order_items = OrderItem.where(order_id: params[:order_id])
    end

    private
    def order_item_params
      params.require(:order_item).permit(:quantity,:product_id, :price, :order_id, :status)
    end
  
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def order_deliver
      order_status = @order_items.uniq.pluck(:status).include?("placed")
    end
  end
end