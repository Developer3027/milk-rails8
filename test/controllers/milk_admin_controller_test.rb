require "test_helper"

class MilkAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get milk_admin_dashboard_url
    assert_response :success
  end
end
