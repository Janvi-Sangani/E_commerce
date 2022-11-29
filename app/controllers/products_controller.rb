class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit destroy update show]
  before_action :authenticate_customer!

  def index
    #  @q = Product.ransack(name_eq: params[:q])
    #  @products = @q.result
    if  params[:product_category_id].present?
     @products = Product.where(product_category_id: params[:product_category_id])
    else
     @products = Product.all.order(updated_at: :desc)
    end
    
    # @q = Product.ransack(params[:q])
    # binding.irb
    # if  params[:product_category_id].present?
    #   @products =  @q.result(distinct: true)
    # #  .where(product_category_id: params[:product_category_id])
    # else
    #   @products = @q.result
    # #  .all.order(updated_at: :desc)
  end

  def show
    @product
  end

  def new
    @product= Product.new
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
end
