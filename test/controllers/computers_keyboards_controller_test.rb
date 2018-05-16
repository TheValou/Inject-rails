require 'test_helper'

class ComputersKeyboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computers_keyboard = computers_keyboards(:one)
  end

  test "should get index" do
    get computers_keyboards_url
    assert_response :success
  end

  test "should get new" do
    get new_computers_keyboard_url
    assert_response :success
  end

  test "should create computers_keyboard" do
    assert_difference('ComputersKeyboard.count') do
      post computers_keyboards_url, params: { computers_keyboard: { description: @computers_keyboard.description, name: @computers_keyboard.name } }
    end

    assert_redirected_to computers_keyboard_url(ComputersKeyboard.last)
  end

  test "should show computers_keyboard" do
    get computers_keyboard_url(@computers_keyboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_computers_keyboard_url(@computers_keyboard)
    assert_response :success
  end

  test "should update computers_keyboard" do
    patch computers_keyboard_url(@computers_keyboard), params: { computers_keyboard: { description: @computers_keyboard.description, name: @computers_keyboard.name } }
    assert_redirected_to computers_keyboard_url(@computers_keyboard)
  end

  test "should destroy computers_keyboard" do
    assert_difference('ComputersKeyboard.count', -1) do
      delete computers_keyboard_url(@computers_keyboard)
    end

    assert_redirected_to computers_keyboards_url
  end
end
