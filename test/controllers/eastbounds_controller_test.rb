require "test_helper"

class EastboundsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eastbounds_index_url
    assert_response :success
  end
end
