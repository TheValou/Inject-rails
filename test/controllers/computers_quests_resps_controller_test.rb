require 'test_helper'

class ComputersQuestsRespsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computers_quests_resp = computers_quests_resps(:one)
  end

  test "should get index" do
    get computers_quests_resps_url
    assert_response :success
  end

  test "should get new" do
    get new_computers_quests_resp_url
    assert_response :success
  end

  test "should create computers_quests_resp" do
    assert_difference('ComputersQuestsResp.count') do
      post computers_quests_resps_url, params: { computers_quests_resp: { indice: @computers_quests_resp.indice, questId: @computers_quests_resp.questId, resp: @computers_quests_resp.resp } }
    end

    assert_redirected_to computers_quests_resp_url(ComputersQuestsResp.last)
  end

  test "should show computers_quests_resp" do
    get computers_quests_resp_url(@computers_quests_resp)
    assert_response :success
  end

  test "should get edit" do
    get edit_computers_quests_resp_url(@computers_quests_resp)
    assert_response :success
  end

  test "should update computers_quests_resp" do
    patch computers_quests_resp_url(@computers_quests_resp), params: { computers_quests_resp: { indice: @computers_quests_resp.indice, questId: @computers_quests_resp.questId, resp: @computers_quests_resp.resp } }
    assert_redirected_to computers_quests_resp_url(@computers_quests_resp)
  end

  test "should destroy computers_quests_resp" do
    assert_difference('ComputersQuestsResp.count', -1) do
      delete computers_quests_resp_url(@computers_quests_resp)
    end

    assert_redirected_to computers_quests_resps_url
  end
end
