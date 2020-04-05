require 'test_helper'

class BentosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bentos_index_url
    assert_response :success
  end

  test "should get show" do
    get bentos_show_url
    assert_response :success
  end

  test "should get new" do
    get bentos_new_url
    assert_response :success
  end

  test "should get edit" do
    get bentos_edit_url
    assert_response :success
  end

end
