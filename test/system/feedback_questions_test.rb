require "application_system_test_case"

class FeedbackQuestionsTest < ApplicationSystemTestCase
  setup do
    @feedback_question = feedback_questions(:one)
  end

  test "visiting the index" do
    visit feedback_questions_url
    assert_selector "h1", text: "Feedback questions"
  end

  test "should create feedback question" do
    visit feedback_questions_url
    click_on "New feedback question"

    fill_in "Product category", with: @feedback_question.product_category_id
    fill_in "Question", with: @feedback_question.question
    click_on "Create Feedback question"

    assert_text "Feedback question was successfully created"
    click_on "Back"
  end

  test "should update Feedback question" do
    visit feedback_question_url(@feedback_question)
    click_on "Edit this feedback question", match: :first

    fill_in "Product category", with: @feedback_question.product_category_id
    fill_in "Question", with: @feedback_question.question
    click_on "Update Feedback question"

    assert_text "Feedback question was successfully updated"
    click_on "Back"
  end

  test "should destroy Feedback question" do
    visit feedback_question_url(@feedback_question)
    click_on "Destroy this feedback question", match: :first

    assert_text "Feedback question was successfully destroyed"
  end
end
