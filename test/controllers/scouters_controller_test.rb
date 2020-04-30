require 'test_helper'

class ScoutersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scouter = scouters(:one)
  end

  test "should get index" do
    get scouters_url
    assert_response :success
  end

  test "should get new" do
    get new_scouter_url
    assert_response :success
  end

  test "should create scouter" do
    assert_difference('Scouter.count') do
      post scouters_url, params: { scouter: { player1: @scouter.player1, player2: @scouter.player2, player3: @scouter.player3, player4: @scouter.player4, player5: @scouter.player5, team: @scouter.team } }
    end

    assert_redirected_to scouter_url(Scouter.last)
  end

  test "should show scouter" do
    get scouter_url(@scouter)
    assert_response :success
  end

  test "should get edit" do
    get edit_scouter_url(@scouter)
    assert_response :success
  end

  test "should update scouter" do
    patch scouter_url(@scouter), params: { scouter: { player1: @scouter.player1, player2: @scouter.player2, player3: @scouter.player3, player4: @scouter.player4, player5: @scouter.player5, team: @scouter.team } }
    assert_redirected_to scouter_url(@scouter)
  end

  test "should destroy scouter" do
    assert_difference('Scouter.count', -1) do
      delete scouter_url(@scouter)
    end

    assert_redirected_to scouters_url
  end
end
