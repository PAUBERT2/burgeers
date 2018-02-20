require 'test_helper'

class BurgersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get burgers_index_url
    assert_response :success
  end

  test "should get show" do
    get burgers_show_url
    assert_response :success
  end

end
