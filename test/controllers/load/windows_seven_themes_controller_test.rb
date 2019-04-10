require 'test_helper'

class Load::WindowsSevenThemesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get load_windows_seven_themes_show_url
    assert_response :success
  end

  test "should get index" do
    get load_windows_seven_themes_index_url
    assert_response :success
  end

end
