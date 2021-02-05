require "test_helper"

class DiningControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dining_index_url
    assert_response :success
  end
end
