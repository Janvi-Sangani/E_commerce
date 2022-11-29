module Admin
  class ProductCategoriesController < ApplicationController
    before_action :set_product_category, only: %i[edit destroy update show]
    before_action :authenticate_user!

    def index
      @product_categories = ProductCategory.all
    end

    def show
    end 

    def new
      @product_category = ProductCategory.new
    end

    def create
      @product_category = ProductCategory.new(product_category_params)
      if @product_category.save
      redirect_to admin_product_categories_path			
      else
        flash.now[:messages] = @product_category.errors.full_messages
        render "new"
      end
    end

    def update
      @product_category.update(product_category_params)
      redirect_to admin_product_categories_path		
    end

    def destroy
      @product_category.destroy
    end

    def product
      @products = Product.where(product_category_id: params[:product_category_id])
    end

    private
    def product_category_params
      params.require(:product_category).permit(:category, :description, :companies)
    end

    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end
  end
end