require "application_system_test_case"

class PrayRequestsTest < ApplicationSystemTestCase
  setup do
    @pray_request = pray_requests(:one)
  end

  test "visiting the index" do
    visit pray_requests_url
    assert_selector "h1", text: "Pray Requests"
  end

  test "creating a Pray request" do
    visit pray_requests_url
    click_on "New Pray Request"

    click_on "Create Pray request"

    assert_text "Pray request was successfully created"
    click_on "Back"
  end

  test "updating a Pray request" do
    visit pray_requests_url
    click_on "Edit", match: :first

    click_on "Update Pray request"

    assert_text "Pray request was successfully updated"
    click_on "Back"
  end

  test "destroying a Pray request" do
    visit pray_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pray request was successfully destroyed"
  end
end
