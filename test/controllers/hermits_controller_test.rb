require "test_helper"

class HermitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hermits_url
    assert_response :success
  end
end
