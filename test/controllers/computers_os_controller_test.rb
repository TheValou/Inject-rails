require 'test_helper'

class ComputersOsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computers_o = computers_os(:one)
  end

  test "should get index" do
    get computers_os_url
    assert_response :success
  end

  test "should get new" do
    get new_computers_o_url
    assert_response :success
  end

  test "should create computers_o" do
    assert_difference('ComputersO.count') do
      post computers_os_url, params: { computers_o: { description: @computers_o.description, name: @computers_o.name } }
    end

    assert_redirected_to computers_o_url(ComputersO.last)
  end

  test "should show computers_o" do
    get computers_o_url(@computers_o)
    assert_response :success
  end

  test "should get edit" do
    get edit_computers_o_url(@computers_o)
    assert_response :success
  end

  test "should update computers_o" do
    patch computers_o_url(@computers_o), params: { computers_o: { description: @computers_o.description, name: @computers_o.name } }
    assert_redirected_to computers_o_url(@computers_o)
  end

  test "should destroy computers_o" do
    assert_difference('ComputersO.count', -1) do
      delete computers_o_url(@computers_o)
    end

    assert_redirected_to computers_os_url
  end
end
