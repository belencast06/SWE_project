require "test_helper"

class ContentPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get content_pages_show_url
    assert_response :success
  end
end
