class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[show edit destroy update]
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    if @cart_items.present?
      @cart_items
    else
      redirect_to empty_cart_items_path
    end
  end

  def new
    if params[:product_id]
      @product = Product.find_by(id: params[:product_id])
      @cart_item = CartItem.new(product_id: @product.id, customer_id: current_customer.id)
    else
      redirect_to products_path
    end
  end

  def create
    # binding.irb
    product = Product.find(params[:cart_item][:product_id].to_i)
    @cart_items = current_customer.cart_items
    if product.quantity >= params[:cart_item][:quantity].to_i && params[:cart_item][:quantity].to_i != 0
      if @cart_items.pluck(:product_id).include?(params[:cart_item][:product_id].to_i)
        update_product = CartItem.find_by(product_id: params[:cart_item][:product_id])
        update_product.update(quantity: update_product.quantity + params[:cart_item][:quantity].to_i )
        updated_total = (update_product.quantity) * (Product.find(params[:cart_item][:product_id].to_i)).price
        update_total = update_product.update(price: updated_total)
        redirect_to cart_items_path
      else
        total = (params[:cart_item][:quantity].to_i) * (Product.find(params[:cart_item][:product_id].to_i)).price
        CartItem.create(cart_item_params.merge(customer_id: current_customer.id, price: total))
        redirect_to cart_items_path
      end
    else
      flash[:messages] = "Please enter valid quantity"
      redirect_to products_path
    end
  end

  def edit
    @product = Product.find_by(id: @cart_item.product.id)
  end

  def update
    if @cart_item.present?
      @product = Product.find_by(id: @cart_item.product.id)
      @cart_item.update(cart_item_params.merge(product_id: @product.id))
      updated_total = (@cart_item.quantity) * (Product.find(params[:cart_item][:product_id].to_i)).price
      update_total = @cart_item.update(price: updated_total)
      redirect_to cart_items_path
    else
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity, :price, :status)
  end
  
  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end