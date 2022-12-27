class FeedbackAnswersController < ApplicationController
  before_action :authenticate_customer!

  def index
  end

  def attempt_answer
    Review.create(rating: params[:rating], product_id: params[:product_id].scan(/\d+/).first.to_i, comment: params[:comment], customer_id: current_customer.id)
    @product_category = Product.find_by(id: params[:product_id].scan(/\d+/).first.to_i).product_category.id
    @category_question = FeedbackQuestion.where(product_category_id: @product_category)
    @feedback_answer = FeedbackAnswer.new
  end

  def submit_review
    value = params.permit(feedback_answer: [:feedback_question_id, :answer_type, :answer]).to_h
    feedback = Feedback.new(product_id: params[:product_id].to_i, customer_id: current_customer.id, order_id: params[:order_id].scan(/\d+/).first.to_i)
    feedback_answer_data = value["feedback_answer"].map{|k| k.merge(feedback_id: feedback.id)}
    FeedbackAnswer.create(feedback_answer_data)
    flash[:messages] = "Thank you for your valuable feedback!"
    redirect_to homes_path
  end

  def new
  end

  def create
  end
  
  private
  def feedback_answer_params
    FeedbackAnswer.new(params.require(:feedback_answer).permit(:feedback_question_id, :answer, :feedback_id))
  end

end