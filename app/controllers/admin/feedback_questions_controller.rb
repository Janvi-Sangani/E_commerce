module Admin
  class FeedbackQuestionsController < ApplicationController
    before_action :set_feedback_question, only: %i[ show edit update destroy ]

    def index
      @feedback_questions = FeedbackQuestion.all
    end

    def as_per_category
      @feedback_question = FeedbackQuestion.where(product_category_id: params[:product_category_id])
    end 

    def show
    end

    def new
      @feedback_question = FeedbackQuestion.new(product_category_id: params[:product_category_id])
    end

    def edit
    end

    def create
      value_array = []
      @feedback_question = FeedbackQuestion.new(feedback_question_params)
      @feedback_question.feedback_question_options.each do |v|
        value_array << v.value
      end
      category_question = FeedbackQuestion.where(product_category_id: params[:feedback_question][:product_category_id].to_i)
      if category_question.pluck(:question).any?(params[:feedback_question][:question])
        flash[:messages] = "Sorry question was already added!"
        redirect_to admin_feedback_questions_path
      elsif value_array.uniq! != nil
        flash[:messages] = "please enter uniq values"
        redirect_to admin_feedback_questions_path
      else
        binding.irb
        @feedback_question.save
        redirect_to admin_feedback_questions_path
      end
    end

    def update
      respond_to do |format|
        if @feedback_question.update(feedback_question_params)
          format.html { redirect_to feedback_question_url(@feedback_question), notice: "Feedback question was successfully updated." }
          format.json { render :show, status: :ok, location: @feedback_question }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @feedback_question.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @feedback_question.destroy  
      # redirect_to admin_product_categories_path
      render "new"
      flash[:messages] = "Question was deleted!"
    end

    private
    def set_feedback_question
      @feedback_question = FeedbackQuestion.find(params[:id])
    end

    def feedback_question_params
      # params.require(:feedback_question).permit(:question, :product_category_id, feedback_question_options_attributes: FeedbackQuestionOption.attribute_names.map(&:to_sym))
      params.require(:feedback_question).permit(:question, :product_category_id, feedback_question_options_attributes: [:id, :feedback_questions_id, :value])
    end
  end
end