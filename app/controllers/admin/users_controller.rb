module Admin
  class UsersController < ApplicationController
    before_action :set_user, only: %i[destroy]
    before_action :authenticate_user!

    def index
      @users = User.with_role(:seller)
    end

    def destroy
      if @user.products.present? || find_orders.present?
        flash[:messages] = "Sorry User can't Delete!"
        redirect_to admin_homes_path
      else
        @user.destroy
        flash[:messages] = "User Deleted Sucessfully!!!"
        redirect_to admin_users_path
      end
    end

    private
    def set_user
      @user = User.find(params[:id])
    end

    def find_orders
      order_item = OrderItem.joins(product: :user).where("users.id =?", @user)
    end
  end
end