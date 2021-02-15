require "test_helper"

class DiningsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dinings_index_url
    assert_response :success
  end
end
