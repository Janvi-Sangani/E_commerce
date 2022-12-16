class ReviewsController < ApplicationController
  before_action :set_review, only: %i[edit destroy update show]
  before_action :authenticate_customer!

  def index
    @review = Review.all
  end

  def new
    params[:product_id].present?
    @product = Product.find_by(id: params[:product_id])
    @review = Review.new(product_id: @product.id)
  end

  def create
    params[:product_id].present?
    # @review = Review.new(review_params.merge(customer_id: current_customer.id))
    #  @review.save!
    if @review = Review.create(review_params.merge(customer_id: current_customer.id))
      redirect_to attempt_answer_feedback_answers_path
      # redirect_to admin_feedback_questions_path(product_id: @product_id)		
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

  # def add_rating
  #   params[:product_id].present?
  #   @review = Review.new(product_id: params[:product_id], customer_id: current_customer.id)
  #   if params[:rating].present?
  #     redirect_to admin_feedback_questions_path
  #   end
  # end
