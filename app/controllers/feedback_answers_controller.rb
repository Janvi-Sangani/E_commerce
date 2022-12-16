class FeedbackAnswersController < ApplicationController
  before_action :authenticate_customer!

  def index
    # @addresses = current_customer.addresses
  end

  def attempt_answer
    # Review.create(rating: params[:rating], product_id: params[:product_id].scan(/\d+/).first.to_i, comment: params[:comment], customer_id: current_customer.id)
    # binding.irb 
    @product_category = Product.find_by(id: params[:product_id].scan(/\d+/).first.to_i).product_category.id
    @category_question = FeedbackQuestion.where(product_category_id: @product_category)
  end

  def new
    # @address = Address.new
  end

  def create
    binding.irb
    FeedbackAnswer.create(feedback_answer_params.merge(product_id: Product.find_by(id: params[:product_id].scan(/\d+/).first.to_i)))
  end
  
  private
  def feedback_answer_params
    params.require(:feedback_answer).permit(:product_id, :customer_id, :feedback_question_id, :answer)
  end
end