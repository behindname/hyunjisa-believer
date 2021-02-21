require "application_system_test_case"

class BelieversTest < ApplicationSystemTestCase
  setup do
    @believer = believers(:one)
  end

  test "visiting the index" do
    visit believers_url
    assert_selector "h1", text: "Believers"
  end

  test "creating a Believer" do
    visit believers_url
    click_on "New Believer"

    fill_in "Addressdetail", with: @believer.addressDetail
    fill_in "Addressprovince", with: @believer.addressProvince
    fill_in "Birthday", with: @believer.birthday
    fill_in "Dharmaname", with: @believer.dharmaName
    fill_in "Email", with: @believer.email
    fill_in "Ganzhi", with: @believer.ganzhi
    fill_in "Gender", with: @believer.gender
    fill_in "Name", with: @believer.name
    fill_in "Phone", with: @believer.phone
    fill_in "Registerday", with: @believer.registerday
    fill_in "Remarks", with: @believer.remarks
    fill_in "Temple", with: @believer.temple_id
    click_on "Create Believer"

    assert_text "Believer was successfully created"
    click_on "Back"
  end

  test "updating a Believer" do
    visit believers_url
    click_on "Edit", match: :first

    fill_in "Addressdetail", with: @believer.addressDetail
    fill_in "Addressprovince", with: @believer.addressProvince
    fill_in "Birthday", with: @believer.birthday
    fill_in "Dharmaname", with: @believer.dharmaName
    fill_in "Email", with: @believer.email
    fill_in "Ganzhi", with: @believer.ganzhi
    fill_in "Gender", with: @believer.gender
    fill_in "Name", with: @believer.name
    fill_in "Phone", with: @believer.phone
    fill_in "Registerday", with: @believer.registerday
    fill_in "Remarks", with: @believer.remarks
    fill_in "Temple", with: @believer.temple_id
    click_on "Update Believer"

    assert_text "Believer was successfully updated"
    click_on "Back"
  end

  test "destroying a Believer" do
    visit believers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Believer was successfully destroyed"
  end
end
