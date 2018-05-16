require 'test_helper'

class SequelizeMetaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sequelize_metum = sequelize_meta(:one)
  end

  test "should get index" do
    get sequelize_meta_url
    assert_response :success
  end

  test "should get new" do
    get new_sequelize_metum_url
    assert_response :success
  end

  test "should create sequelize_metum" do
    assert_difference('SequelizeMetum.count') do
      post sequelize_meta_url, params: { sequelize_metum: {  } }
    end

    assert_redirected_to sequelize_metum_url(SequelizeMetum.last)
  end

  test "should show sequelize_metum" do
    get sequelize_metum_url(@sequelize_metum)
    assert_response :success
  end

  test "should get edit" do
    get edit_sequelize_metum_url(@sequelize_metum)
    assert_response :success
  end

  test "should update sequelize_metum" do
    patch sequelize_metum_url(@sequelize_metum), params: { sequelize_metum: {  } }
    assert_redirected_to sequelize_metum_url(@sequelize_metum)
  end

  test "should destroy sequelize_metum" do
    assert_difference('SequelizeMetum.count', -1) do
      delete sequelize_metum_url(@sequelize_metum)
    end

    assert_redirected_to sequelize_meta_url
  end
end
