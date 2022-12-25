class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit destroy update show]
  before_action :authenticate_customer!

  def index
    if params[:product_category_id].present?
     @products = Product.where(product_category_id: params[:product_category_id])
    else
     @products = Product.all.order(updated_at: :desc)
    end
  end

  def search
    @products = Product.filter(params.slice(:search, :price))
    if @products.count == 0
      flash[:messages] = "Sorry no matches for #{params[:search]}"
      redirect_to homes_path
    end
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
