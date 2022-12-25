module Admin
  class OrdersController < ApplicationController
    before_action :set_order, only: %i[edit destroy update show]
    before_action :authenticate_user!
    def index
      @orders = Order.all
    end

    def order_search
      @orders = Order.filter(params.slice(:search, :price, :status, :place_order))
      if @orders.count == 0
        flash[:messages] = "Sorry no matches found!!"
        redirect_to admin_homes_path
      end
    end

    private 
    def set_order
      @order = Order.find(params[:id])
    end
  end
end