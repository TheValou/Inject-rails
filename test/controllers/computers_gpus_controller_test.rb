require 'test_helper'

class ComputersGpusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computers_gpu = computers_gpus(:one)
  end

  test "should get index" do
    get computers_gpus_url
    assert_response :success
  end

  test "should get new" do
    get new_computers_gpu_url
    assert_response :success
  end

  test "should create computers_gpu" do
    assert_difference('ComputersGpu.count') do
      post computers_gpus_url, params: { computers_gpu: { description: @computers_gpu.description, name: @computers_gpu.name } }
    end

    assert_redirected_to computers_gpu_url(ComputersGpu.last)
  end

  test "should show computers_gpu" do
    get computers_gpu_url(@computers_gpu)
    assert_response :success
  end

  test "should get edit" do
    get edit_computers_gpu_url(@computers_gpu)
    assert_response :success
  end

  test "should update computers_gpu" do
    patch computers_gpu_url(@computers_gpu), params: { computers_gpu: { description: @computers_gpu.description, name: @computers_gpu.name } }
    assert_redirected_to computers_gpu_url(@computers_gpu)
  end

  test "should destroy computers_gpu" do
    assert_difference('ComputersGpu.count', -1) do
      delete computers_gpu_url(@computers_gpu)
    end

    assert_redirected_to computers_gpus_url
  end
end
