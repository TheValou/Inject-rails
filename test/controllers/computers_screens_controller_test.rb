require 'test_helper'

class ComputersScreensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computers_screen = computers_screens(:one)
  end

  test "should get index" do
    get computers_screens_url
    assert_response :success
  end

  test "should get new" do
    get new_computers_screen_url
    assert_response :success
  end

  test "should create computers_screen" do
    assert_difference('ComputersScreen.count') do
      post computers_screens_url, params: { computers_screen: { description: @computers_screen.description, refresh_rate: @computers_screen.refresh_rate, resolution: @computers_screen.resolution, size: @computers_screen.size, type: @computers_screen.type } }
    end

    assert_redirected_to computers_screen_url(ComputersScreen.last)
  end

  test "should show computers_screen" do
    get computers_screen_url(@computers_screen)
    assert_response :success
  end

  test "should get edit" do
    get edit_computers_screen_url(@computers_screen)
    assert_response :success
  end

  test "should update computers_screen" do
    patch computers_screen_url(@computers_screen), params: { computers_screen: { description: @computers_screen.description, refresh_rate: @computers_screen.refresh_rate, resolution: @computers_screen.resolution, size: @computers_screen.size, type: @computers_screen.type } }
    assert_redirected_to computers_screen_url(@computers_screen)
  end

  test "should destroy computers_screen" do
    assert_difference('ComputersScreen.count', -1) do
      delete computers_screen_url(@computers_screen)
    end

    assert_redirected_to computers_screens_url
  end
end
