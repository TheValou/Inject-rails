require 'test_helper'

class SequelizemetaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sequelizemetum = sequelizemeta(:one)
  end

  test "should get index" do
    get sequelizemeta_url
    assert_response :success
  end

  test "should get new" do
    get new_sequelizemetum_url
    assert_response :success
  end

  test "should create sequelizemetum" do
    assert_difference('Sequelizemetum.count') do
      post sequelizemeta_url, params: { sequelizemetum: { active: @sequelizemetum.active, active: @sequelizemetum.active, activityId: @sequelizemetum.activityId, activityid: @sequelizemetum.activityid, authId: @sequelizemetum.authId, chipsetid: @sequelizemetum.chipsetid, computerId: @sequelizemetum.computerId, connector_available: @sequelizemetum.connector_available, cpuid: @sequelizemetum.cpuid, createdat: @sequelizemetum.createdat, createdat: @sequelizemetum.createdat, createdat: @sequelizemetum.createdat, createdat: @sequelizemetum.createdat, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, designation: @sequelizemetum.designation, domain: @sequelizemetum.domain, email: @sequelizemetum.email, firstname: @sequelizemetum.firstname, gpuid: @sequelizemetum.gpuid, height: @sequelizemetum.height, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, indice: @sequelizemetum.indice, keyboardid: @sequelizemetum.keyboardid, lastname: @sequelizemetum.lastname, length: @sequelizemetum.length, memory_max_size: @sequelizemetum.memory_max_size, memory_size: @sequelizemetum.memory_size, memory_type: @sequelizemetum.memory_type, model: @sequelizemetum.model, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, network: @sequelizemetum.network, osid: @sequelizemetum.osid, password: @sequelizemetum.password, picture: @sequelizemetum.picture, pricing: @sequelizemetum.pricing, quest: @sequelizemetum.quest, questId: @sequelizemetum.questId, refresh_rate: @sequelizemetum.refresh_rate, resolution: @sequelizemetum.resolution, resp: @sequelizemetum.resp, roleId: @sequelizemetum.roleId, screenId: @sequelizemetum.screenId, size: @sequelizemetum.size, storage_size: @sequelizemetum.storage_size, storage_type: @sequelizemetum.storage_type, time: @sequelizemetum.time, time: @sequelizemetum.time, time: @sequelizemetum.time, time: @sequelizemetum.time, time: @sequelizemetum.time, time: @sequelizemetum.time, time: @sequelizemetum.time, traderId: @sequelizemetum.traderId, type: @sequelizemetum.type, updatedat: @sequelizemetum.updatedat, updatedat: @sequelizemetum.updatedat, updatedat: @sequelizemetum.updatedat, url: @sequelizemetum.url, webcam: @sequelizemetum.webcam, weight: @sequelizemetum.weight, width: @sequelizemetum.width, with: @sequelizemetum.with, with: @sequelizemetum.with, with: @sequelizemetum.with, with: @sequelizemetum.with, with: @sequelizemetum.with, with: @sequelizemetum.with, with: @sequelizemetum.with, zone: @sequelizemetum.zone, zone: @sequelizemetum.zone, zone: @sequelizemetum.zone, zone: @sequelizemetum.zone, zone: @sequelizemetum.zone, zone: @sequelizemetum.zone, zone: @sequelizemetum.zone } }
    end

    assert_redirected_to sequelizemetum_url(Sequelizemetum.last)
  end

  test "should show sequelizemetum" do
    get sequelizemetum_url(@sequelizemetum)
    assert_response :success
  end

  test "should get edit" do
    get edit_sequelizemetum_url(@sequelizemetum)
    assert_response :success
  end

  test "should update sequelizemetum" do
    patch sequelizemetum_url(@sequelizemetum), params: { sequelizemetum: { active: @sequelizemetum.active, active: @sequelizemetum.active, activityId: @sequelizemetum.activityId, activityid: @sequelizemetum.activityid, authId: @sequelizemetum.authId, chipsetid: @sequelizemetum.chipsetid, computerId: @sequelizemetum.computerId, connector_available: @sequelizemetum.connector_available, cpuid: @sequelizemetum.cpuid, createdat: @sequelizemetum.createdat, createdat: @sequelizemetum.createdat, createdat: @sequelizemetum.createdat, createdat: @sequelizemetum.createdat, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, description: @sequelizemetum.description, designation: @sequelizemetum.designation, domain: @sequelizemetum.domain, email: @sequelizemetum.email, firstname: @sequelizemetum.firstname, gpuid: @sequelizemetum.gpuid, height: @sequelizemetum.height, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, id: @sequelizemetum.id, indice: @sequelizemetum.indice, keyboardid: @sequelizemetum.keyboardid, lastname: @sequelizemetum.lastname, length: @sequelizemetum.length, memory_max_size: @sequelizemetum.memory_max_size, memory_size: @sequelizemetum.memory_size, memory_type: @sequelizemetum.memory_type, model: @sequelizemetum.model, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, name: @sequelizemetum.name, network: @sequelizemetum.network, osid: @sequelizemetum.osid, password: @sequelizemetum.password, picture: @sequelizemetum.picture, pricing: @sequelizemetum.pricing, quest: @sequelizemetum.quest, questId: @sequelizemetum.questId, refresh_rate: @sequelizemetum.refresh_rate, resolution: @sequelizemetum.resolution, resp: @sequelizemetum.resp, roleId: @sequelizemetum.roleId, screenId: @sequelizemetum.screenId, size: @sequelizemetum.size, storage_size: @sequelizemetum.storage_size, storage_type: @sequelizemetum.storage_type, time: @sequelizemetum.time, time: @sequelizemetum.time, time: @sequelizemetum.time, time: @sequelizemetum.time, time: @sequelizemetum.time, time: @sequelizemetum.time, time: @sequelizemetum.time, traderId: @sequelizemetum.traderId, type: @sequelizemetum.type, updatedat: @sequelizemetum.updatedat, updatedat: @sequelizemetum.updatedat, updatedat: @sequelizemetum.updatedat, url: @sequelizemetum.url, webcam: @sequelizemetum.webcam, weight: @sequelizemetum.weight, width: @sequelizemetum.width, with: @sequelizemetum.with, with: @sequelizemetum.with, with: @sequelizemetum.with, with: @sequelizemetum.with, with: @sequelizemetum.with, with: @sequelizemetum.with, with: @sequelizemetum.with, zone: @sequelizemetum.zone, zone: @sequelizemetum.zone, zone: @sequelizemetum.zone, zone: @sequelizemetum.zone, zone: @sequelizemetum.zone, zone: @sequelizemetum.zone, zone: @sequelizemetum.zone } }
    assert_redirected_to sequelizemetum_url(@sequelizemetum)
  end

  test "should destroy sequelizemetum" do
    assert_difference('Sequelizemetum.count', -1) do
      delete sequelizemetum_url(@sequelizemetum)
    end

    assert_redirected_to sequelizemeta_url
  end
end
