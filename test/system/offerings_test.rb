require "application_system_test_case"

class OfferingsTest < ApplicationSystemTestCase
  setup do
    @offering = offerings(:one)
  end

  test "visiting the index" do
    visit offerings_url
    assert_selector "h1", text: "Offerings"
  end

  test "creating a Offering" do
    visit offerings_url
    click_on "New Offering"

    fill_in "Believer", with: @offering.believer_id
    fill_in "Buddha", with: @offering.buddha_id
    fill_in "Donator", with: @offering.donator
    fill_in "Offerday", with: @offering.offerDay
    fill_in "Offeroraddress", with: @offering.offerorAddress
    fill_in "Offerorbirthyear", with: @offering.offerorBirthyear
    fill_in "Offerorname", with: @offering.offerorName
    fill_in "Offerorphone", with: @offering.offerorPhone
    fill_in "Offerorrelation", with: @offering.offerorRelation
    fill_in "Remarks", with: @offering.remarks
    fill_in "Request", with: @offering.request
    fill_in "Temple", with: @offering.temple_id
    click_on "Create Offering"

    assert_text "Offering was successfully created"
    click_on "Back"
  end

  test "updating a Offering" do
    visit offerings_url
    click_on "Edit", match: :first

    fill_in "Believer", with: @offering.believer_id
    fill_in "Buddha", with: @offering.buddha_id
    fill_in "Donator", with: @offering.donator
    fill_in "Offerday", with: @offering.offerDay
    fill_in "Offeroraddress", with: @offering.offerorAddress
    fill_in "Offerorbirthyear", with: @offering.offerorBirthyear
    fill_in "Offerorname", with: @offering.offerorName
    fill_in "Offerorphone", with: @offering.offerorPhone
    fill_in "Offerorrelation", with: @offering.offerorRelation
    fill_in "Remarks", with: @offering.remarks
    fill_in "Request", with: @offering.request
    fill_in "Temple", with: @offering.temple_id
    click_on "Update Offering"

    assert_text "Offering was successfully updated"
    click_on "Back"
  end

  test "destroying a Offering" do
    visit offerings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Offering was successfully destroyed"
  end
end
