require 'test_helper'

class ComputersBrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computers_brand = computers_brands(:one)
  end

  test "should get index" do
    get computers_brands_url
    assert_response :success
  end

  test "should get new" do
    get new_computers_brand_url
    assert_response :success
  end

  test "should create computers_brand" do
    assert_difference('ComputersBrand.count') do
      post computers_brands_url, params: { computers_brand: { description: @computers_brand.description, name: @computers_brand.name } }
    end

    assert_redirected_to computers_brand_url(ComputersBrand.last)
  end

  test "should show computers_brand" do
    get computers_brand_url(@computers_brand)
    assert_response :success
  end

  test "should get edit" do
    get edit_computers_brand_url(@computers_brand)
    assert_response :success
  end

  test "should update computers_brand" do
    patch computers_brand_url(@computers_brand), params: { computers_brand: { description: @computers_brand.description, name: @computers_brand.name } }
    assert_redirected_to computers_brand_url(@computers_brand)
  end

  test "should destroy computers_brand" do
    assert_difference('ComputersBrand.count', -1) do
      delete computers_brand_url(@computers_brand)
    end

    assert_redirected_to computers_brands_url
  end
end
