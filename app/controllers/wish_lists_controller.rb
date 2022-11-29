class WishListsController < ApplicationController
  before_action :set_wish_list, only: %i[show edit destroy update]
  before_action :authenticate_customer!

  def index
    @wish_list_items = current_customer.wish_lists
    if @wish_list_items.present?
      @wish_list_items
    else
      redirect_to empty_wish_lists_path
    end
  end

  def create_wish_list
    if WishList.find_by(product_id: params[:product_id]).present?
      flash[:messages] = "Already added in wishlist"
      redirect_to wish_lists_path
    else
      @product = Product.find_by(id: params[:product_id])
      WishList.create(product_id: @product.id, customer_id: current_customer.id, price:@product.price)
      redirect_to wish_lists_path
    end
  end
  
  def destroy
    if @wish_list.present?
      @wish_list.destroy
      flash[:messages] = "Deleted from cart!"
    else
      redirect_to homes_path
    end
  end

  private
  def wish_list_params
    params.require(:wish_list).permit(:product_id, :customer_id, :price)
  end

  def set_wish_list
    @wish_list = WishList.find(params[:id])
  end
end
