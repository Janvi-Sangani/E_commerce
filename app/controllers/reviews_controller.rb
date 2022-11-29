class ReviewsController < ApplicationController
  before_action :set_review, only: %i[edit destroy update show]
  before_action :authenticate_customer!

  def index
    @review = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params.merge(customer_id: current_customer.id, product_id: params[@product.id]))
    if @review.save
      redirect_to products_path		
    else
      flash.now[:messages] = @review.errors.full_messages
      render "new"
    end
  end

  def update
    @review.update(review_params)
    redirect_to products_path	
  end

  def destroy
    @review.destroy
    redirect_to products_path
  end

  private
  def review_params
    params.require(:review).permit(:rating, :comment, :customer_id, :product_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end