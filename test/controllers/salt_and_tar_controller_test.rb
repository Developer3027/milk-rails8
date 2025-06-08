require "test_helper"

class SaltAndTarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get salt_and_tar_index_url
    assert_response :success
  end
end
