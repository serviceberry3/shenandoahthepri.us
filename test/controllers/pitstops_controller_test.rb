require "test_helper"

class PitstopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pitstops_index_url
    assert_response :success
  end
end
