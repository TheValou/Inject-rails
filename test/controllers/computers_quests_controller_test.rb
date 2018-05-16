require 'test_helper'

class ComputersQuestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computers_quest = computers_quests(:one)
  end

  test "should get index" do
    get computers_quests_url
    assert_response :success
  end

  test "should get new" do
    get new_computers_quest_url
    assert_response :success
  end

  test "should create computers_quest" do
    assert_difference('ComputersQuest.count') do
      post computers_quests_url, params: { computers_quest: { activityId: @computers_quest.activityId, createdat: @computers_quest.createdat, domain: @computers_quest.domain, quest: @computers_quest.quest, updatedat: @computers_quest.updatedat } }
    end

    assert_redirected_to computers_quest_url(ComputersQuest.last)
  end

  test "should show computers_quest" do
    get computers_quest_url(@computers_quest)
    assert_response :success
  end

  test "should get edit" do
    get edit_computers_quest_url(@computers_quest)
    assert_response :success
  end

  test "should update computers_quest" do
    patch computers_quest_url(@computers_quest), params: { computers_quest: { activityId: @computers_quest.activityId, createdat: @computers_quest.createdat, domain: @computers_quest.domain, quest: @computers_quest.quest, updatedat: @computers_quest.updatedat } }
    assert_redirected_to computers_quest_url(@computers_quest)
  end

  test "should destroy computers_quest" do
    assert_difference('ComputersQuest.count', -1) do
      delete computers_quest_url(@computers_quest)
    end

    assert_redirected_to computers_quests_url
  end
end
