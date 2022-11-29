module Admin
  class OrdersController < ApplicationController
    before_action :set_order, only: %i[edit destroy update show]
    before_action :authenticate_user!
    def index
      @orders = Order.all
    end

    private 
    def set_order
      @order = Order.find(params[:id])
    end
  end
end