require "test_helper"

class FeedbackQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feedback_question = feedback_questions(:one)
  end

  test "should get index" do
    get feedback_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_feedback_question_url
    assert_response :success
  end

  test "should create feedback_question" do
    assert_difference("FeedbackQuestion.count") do
      post feedback_questions_url, params: { feedback_question: { product_category_id: @feedback_question.product_category_id, question: @feedback_question.question } }
    end

    assert_redirected_to feedback_question_url(FeedbackQuestion.last)
  end

  test "should show feedback_question" do
    get feedback_question_url(@feedback_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_feedback_question_url(@feedback_question)
    assert_response :success
  end

  test "should update feedback_question" do
    patch feedback_question_url(@feedback_question), params: { feedback_question: { product_category_id: @feedback_question.product_category_id, question: @feedback_question.question } }
    assert_redirected_to feedback_question_url(@feedback_question)
  end

  test "should destroy feedback_question" do
    assert_difference("FeedbackQuestion.count", -1) do
      delete feedback_question_url(@feedback_question)
    end

    assert_redirected_to feedback_questions_url
  end
end
