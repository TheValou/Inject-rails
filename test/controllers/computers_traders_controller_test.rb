require 'test_helper'

class ComputersTradersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computers_trader = computers_traders(:one)
  end

  test "should get index" do
    get computers_traders_url
    assert_response :success
  end

  test "should get new" do
    get new_computers_trader_url
    assert_response :success
  end

  test "should create computers_trader" do
    assert_difference('ComputersTrader.count') do
      post computers_traders_url, params: { computers_trader: { description: @computers_trader.description, name: @computers_trader.name } }
    end

    assert_redirected_to computers_trader_url(ComputersTrader.last)
  end

  test "should show computers_trader" do
    get computers_trader_url(@computers_trader)
    assert_response :success
  end

  test "should get edit" do
    get edit_computers_trader_url(@computers_trader)
    assert_response :success
  end

  test "should update computers_trader" do
    patch computers_trader_url(@computers_trader), params: { computers_trader: { description: @computers_trader.description, name: @computers_trader.name } }
    assert_redirected_to computers_trader_url(@computers_trader)
  end

  test "should destroy computers_trader" do
    assert_difference('ComputersTrader.count', -1) do
      delete computers_trader_url(@computers_trader)
    end

    assert_redirected_to computers_traders_url
  end
end
