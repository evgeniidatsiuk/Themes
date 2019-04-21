require 'test_helper'

class Load::WindowsEightThemesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get load_windows_eight_themes_index_url
    assert_response :success
  end

  test "should get show" do
    get load_windows_eight_themes_show_url
    assert_response :success
  end

end
