require 'test_helper'

class ComputersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computer = computers(:one)
  end

  test "should get index" do
    get computers_url
    assert_response :success
  end

  test "should get new" do
    get new_computer_url
    assert_response :success
  end

  test "should create computer" do
    assert_difference('Computer.count') do
      post computers_url, params: { computer: { active: @computer.active, activityid: @computer.activityid, chipsetid: @computer.chipsetid, connector_available: @computer.connector_available, cpuid: @computer.cpuid, createdat: @computer.createdat, designation: @computer.designation, gpuid: @computer.gpuid, height: @computer.height, keyboardid: @computer.keyboardid, length: @computer.length, memory_max_size: @computer.memory_max_size, memory_size: @computer.memory_size, memory_type: @computer.memory_type, model: @computer.model, network: @computer.network, osid: @computer.osid, picture: @computer.picture, screenId: @computer.screenId, storage_size: @computer.storage_size, storage_type: @computer.storage_type, updatedat: @computer.updatedat, webcam: @computer.webcam, weight: @computer.weight, width: @computer.width } }
    end

    assert_redirected_to computer_url(Computer.last)
  end

  test "should show computer" do
    get computer_url(@computer)
    assert_response :success
  end

  test "should get edit" do
    get edit_computer_url(@computer)
    assert_response :success
  end

  test "should update computer" do
    patch computer_url(@computer), params: { computer: { active: @computer.active, activityid: @computer.activityid, chipsetid: @computer.chipsetid, connector_available: @computer.connector_available, cpuid: @computer.cpuid, createdat: @computer.createdat, designation: @computer.designation, gpuid: @computer.gpuid, height: @computer.height, keyboardid: @computer.keyboardid, length: @computer.length, memory_max_size: @computer.memory_max_size, memory_size: @computer.memory_size, memory_type: @computer.memory_type, model: @computer.model, network: @computer.network, osid: @computer.osid, picture: @computer.picture, screenId: @computer.screenId, storage_size: @computer.storage_size, storage_type: @computer.storage_type, updatedat: @computer.updatedat, webcam: @computer.webcam, weight: @computer.weight, width: @computer.width } }
    assert_redirected_to computer_url(@computer)
  end

  test "should destroy computer" do
    assert_difference('Computer.count', -1) do
      delete computer_url(@computer)
    end

    assert_redirected_to computers_url
  end
end
