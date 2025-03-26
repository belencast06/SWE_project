require "test_helper"

class AssessmentPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get assessment_pages_show_url
    assert_response :success
  end
end
