require 'test_helper'

class ComputersCpusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computers_cpu = computers_cpus(:one)
  end

  test "should get index" do
    get computers_cpus_url
    assert_response :success
  end

  test "should get new" do
    get new_computers_cpu_url
    assert_response :success
  end

  test "should create computers_cpu" do
    assert_difference('ComputersCpu.count') do
      post computers_cpus_url, params: { computers_cpu: { description: @computers_cpu.description, name: @computers_cpu.name } }
    end

    assert_redirected_to computers_cpu_url(ComputersCpu.last)
  end

  test "should show computers_cpu" do
    get computers_cpu_url(@computers_cpu)
    assert_response :success
  end

  test "should get edit" do
    get edit_computers_cpu_url(@computers_cpu)
    assert_response :success
  end

  test "should update computers_cpu" do
    patch computers_cpu_url(@computers_cpu), params: { computers_cpu: { description: @computers_cpu.description, name: @computers_cpu.name } }
    assert_redirected_to computers_cpu_url(@computers_cpu)
  end

  test "should destroy computers_cpu" do
    assert_difference('ComputersCpu.count', -1) do
      delete computers_cpu_url(@computers_cpu)
    end

    assert_redirected_to computers_cpus_url
  end
end
