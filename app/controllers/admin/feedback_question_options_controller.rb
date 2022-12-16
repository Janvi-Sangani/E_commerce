module Admin
  class FeedbackQuestionOptionsController < ApplicationController

    def new
      @feedback_question_option = FeedbackQuestionOption.new
    end
  end
end