require 'test_helper'

class UsersRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_role = users_roles(:one)
  end

  test "should get index" do
    get users_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_users_role_url
    assert_response :success
  end

  test "should create users_role" do
    assert_difference('UsersRole.count') do
      post users_roles_url, params: { users_role: { description: @users_role.description, name: @users_role.name } }
    end

    assert_redirected_to users_role_url(UsersRole.last)
  end

  test "should show users_role" do
    get users_role_url(@users_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_role_url(@users_role)
    assert_response :success
  end

  test "should update users_role" do
    patch users_role_url(@users_role), params: { users_role: { description: @users_role.description, name: @users_role.name } }
    assert_redirected_to users_role_url(@users_role)
  end

  test "should destroy users_role" do
    assert_difference('UsersRole.count', -1) do
      delete users_role_url(@users_role)
    end

    assert_redirected_to users_roles_url
  end
end
