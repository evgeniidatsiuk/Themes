require 'test_helper'

class UserparamsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get userparams_new_url
    assert_response :success
  end

  test "should get show" do
    get userparams_show_url
    assert_response :success
  end

  test "should get edit" do
    get userparams_edit_url
    assert_response :success
  end

end
