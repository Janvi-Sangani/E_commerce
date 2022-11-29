module Admin
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[edit destroy update show]
    before_action :authenticate_user!

    def index
      @products = policy_scope(Product)
    end

    def new
      @product= Product.new
    end
  
    def create
      @product = Product.new(product_params.merge(image: params[:products][:image]))
      if @product.save
        redirect_to admin_products_path		
      else
        flash.now[:messages] = @product.errors.full_messages
        render "new"
      end
    end
  
    def update
      @product.update(product_params)
      redirect_to admin_products_path	
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path
    end
  
    private
    def product_params
      params.require(:product).permit(:name,:quantity,:product_category_id, :price, :user_id, :image)
    end
  
    def set_product
      @product = Product.find(params[:id])
    end
  end
end