require "application_system_test_case"

class ScoutersTest < ApplicationSystemTestCase
  setup do
    @scouter = scouters(:one)
  end

  test "visiting the index" do
    visit scouters_url
    assert_selector "h1", text: "Scouters"
  end

  test "creating a Scouter" do
    visit scouters_url
    click_on "New Scouter"

    fill_in "Player1", with: @scouter.player1
    fill_in "Player2", with: @scouter.player2
    fill_in "Player3", with: @scouter.player3
    fill_in "Player4", with: @scouter.player4
    fill_in "Player5", with: @scouter.player5
    fill_in "Team", with: @scouter.team
    click_on "Create Scouter"

    assert_text "Scouter was successfully created"
    click_on "Back"
  end

  test "updating a Scouter" do
    visit scouters_url
    click_on "Edit", match: :first

    fill_in "Player1", with: @scouter.player1
    fill_in "Player2", with: @scouter.player2
    fill_in "Player3", with: @scouter.player3
    fill_in "Player4", with: @scouter.player4
    fill_in "Player5", with: @scouter.player5
    fill_in "Team", with: @scouter.team
    click_on "Update Scouter"

    assert_text "Scouter was successfully updated"
    click_on "Back"
  end

  test "destroying a Scouter" do
    visit scouters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scouter was successfully destroyed"
  end
end
