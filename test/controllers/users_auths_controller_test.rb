require 'test_helper'

class UsersAuthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_auth = users_auths(:one)
  end

  test "should get index" do
    get users_auths_url
    assert_response :success
  end

  test "should get new" do
    get new_users_auth_url
    assert_response :success
  end

  test "should create users_auth" do
    assert_difference('UsersAuth.count') do
      post users_auths_url, params: { users_auth: { description: @users_auth.description, name: @users_auth.name } }
    end

    assert_redirected_to users_auth_url(UsersAuth.last)
  end

  test "should show users_auth" do
    get users_auth_url(@users_auth)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_auth_url(@users_auth)
    assert_response :success
  end

  test "should update users_auth" do
    patch users_auth_url(@users_auth), params: { users_auth: { description: @users_auth.description, name: @users_auth.name } }
    assert_redirected_to users_auth_url(@users_auth)
  end

  test "should destroy users_auth" do
    assert_difference('UsersAuth.count', -1) do
      delete users_auth_url(@users_auth)
    end

    assert_redirected_to users_auths_url
  end
end
