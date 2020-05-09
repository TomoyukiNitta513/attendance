require "application_system_test_case"

class RanksTest < ApplicationSystemTestCase
  setup do
    @rank = ranks(:one)
  end

  test "visiting the index" do
    visit ranks_url
    assert_selector "h1", text: "Ranks"
  end

  test "creating a Rank" do
    visit ranks_url
    click_on "New Rank"

    fill_in "Rank", with: @rank.rank
    fill_in "User", with: @rank.user_id
    click_on "Create Rank"

    assert_text "Rank was successfully created"
    click_on "Back"
  end

  test "updating a Rank" do
    visit ranks_url
    click_on "Edit", match: :first

    fill_in "Rank", with: @rank.rank
    fill_in "User", with: @rank.user_id
    click_on "Update Rank"

    assert_text "Rank was successfully updated"
    click_on "Back"
  end

  test "destroying a Rank" do
    visit ranks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rank was successfully destroyed"
  end
end
