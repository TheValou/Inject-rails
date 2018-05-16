require 'test_helper'

class ComputersActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computers_activity = computers_activities(:one)
  end

  test "should get index" do
    get computers_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_computers_activity_url
    assert_response :success
  end

  test "should create computers_activity" do
    assert_difference('ComputersActivity.count') do
      post computers_activities_url, params: { computers_activity: { description: @computers_activity.description, name: @computers_activity.name } }
    end

    assert_redirected_to computers_activity_url(ComputersActivity.last)
  end

  test "should show computers_activity" do
    get computers_activity_url(@computers_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_computers_activity_url(@computers_activity)
    assert_response :success
  end

  test "should update computers_activity" do
    patch computers_activity_url(@computers_activity), params: { computers_activity: { description: @computers_activity.description, name: @computers_activity.name } }
    assert_redirected_to computers_activity_url(@computers_activity)
  end

  test "should destroy computers_activity" do
    assert_difference('ComputersActivity.count', -1) do
      delete computers_activity_url(@computers_activity)
    end

    assert_redirected_to computers_activities_url
  end
end
