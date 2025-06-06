require "test_helper"

class SaltAndTarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get saltandtar_url
    assert_response :success
  end
end
