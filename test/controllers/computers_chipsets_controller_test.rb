require 'test_helper'

class ComputersChipsetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computers_chipset = computers_chipsets(:one)
  end

  test "should get index" do
    get computers_chipsets_url
    assert_response :success
  end

  test "should get new" do
    get new_computers_chipset_url
    assert_response :success
  end

  test "should create computers_chipset" do
    assert_difference('ComputersChipset.count') do
      post computers_chipsets_url, params: { computers_chipset: { description: @computers_chipset.description, name: @computers_chipset.name } }
    end

    assert_redirected_to computers_chipset_url(ComputersChipset.last)
  end

  test "should show computers_chipset" do
    get computers_chipset_url(@computers_chipset)
    assert_response :success
  end

  test "should get edit" do
    get edit_computers_chipset_url(@computers_chipset)
    assert_response :success
  end

  test "should update computers_chipset" do
    patch computers_chipset_url(@computers_chipset), params: { computers_chipset: { description: @computers_chipset.description, name: @computers_chipset.name } }
    assert_redirected_to computers_chipset_url(@computers_chipset)
  end

  test "should destroy computers_chipset" do
    assert_difference('ComputersChipset.count', -1) do
      delete computers_chipset_url(@computers_chipset)
    end

    assert_redirected_to computers_chipsets_url
  end
end
