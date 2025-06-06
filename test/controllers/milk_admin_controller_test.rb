require "test_helper"

class MilkAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get root_url
    assert_response :success
  end
end
