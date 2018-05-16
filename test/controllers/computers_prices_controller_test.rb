require 'test_helper'

class ComputersPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computers_price = computers_prices(:one)
  end

  test "should get index" do
    get computers_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_computers_price_url
    assert_response :success
  end

  test "should create computers_price" do
    assert_difference('ComputersPrice.count') do
      post computers_prices_url, params: { computers_price: { computerId: @computers_price.computerId, createdat: @computers_price.createdat, pricing: @computers_price.pricing, traderId: @computers_price.traderId, url: @computers_price.url } }
    end

    assert_redirected_to computers_price_url(ComputersPrice.last)
  end

  test "should show computers_price" do
    get computers_price_url(@computers_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_computers_price_url(@computers_price)
    assert_response :success
  end

  test "should update computers_price" do
    patch computers_price_url(@computers_price), params: { computers_price: { computerId: @computers_price.computerId, createdat: @computers_price.createdat, pricing: @computers_price.pricing, traderId: @computers_price.traderId, url: @computers_price.url } }
    assert_redirected_to computers_price_url(@computers_price)
  end

  test "should destroy computers_price" do
    assert_difference('ComputersPrice.count', -1) do
      delete computers_price_url(@computers_price)
    end

    assert_redirected_to computers_prices_url
  end
end
