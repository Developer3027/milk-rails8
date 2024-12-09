require "test_helper"

class CopywriterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get copywriter_index_url
    assert_response :success
  end
end
