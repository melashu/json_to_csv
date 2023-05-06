require "test_helper"

class ConvertsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get converts_index_url
    assert_response :success
  end
end
